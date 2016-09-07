get '/restaurants' do
	@restaurants = Restaurant.all

	erb :'restaurants/index'
end


get '/restaurants/new' do
	logged_out?
	erb :'restaurants/new'
end

get	'/restaurants/:id' do
	@restaurant = Restaurant.find(params[:id])
	erb :'restaurants/show'
end

post '/restaurants' do
	restaurant = Restaurant.new(params[:restaurant])
	restaurant.author = current_user
	if restaurant.save

		redirect "/restaurants/#{restaurant.id}"
	else
		@errors = restaurant.errors.full_messages
		erb :'restaurants/new'
	end
end

get '/restaurants/:id/edit' do
	@restaurant = Restaurant.find(params[:id])
	redirect '/' if current_user != @restaurant.author
	erb :'restaurants/edit'
end

put '/restaurants/:id' do
	@restaurant = Restaurant.find(params[:id])
	@restaurant.assign_attributes(params[:restaurant])

	if @restaurant.save

		redirect "/restaurants/#{@restaurant.id}"
	else
		@errors = @restaurant.errors.full_messages
		erb :'restaurants/edit'
	end

end

delete '/restaurants/:id' do
	restaurant = Restaurant.find(params[:id])
	restaurant.destroy

	redirect "/restaurants"
end
























