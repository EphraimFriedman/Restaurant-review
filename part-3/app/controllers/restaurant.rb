get '/restaurants/new' do
	
	erb :'restaurants/new'
end

get	'/restuarants/:id' do

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

