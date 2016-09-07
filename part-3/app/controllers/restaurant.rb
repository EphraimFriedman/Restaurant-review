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

