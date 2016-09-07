post '/restaurants/:id/reviews' do
	@restaurant = Restaurant.find(params[:id])
	review = @restaurant.reviews.build(rating: params[:rating].to_i, body:params[:body] )

	review.author = current_user
	if review.save
		@message = "<p>Thak you for leaving a review.</p>"
		erb :'restaurants/show'
	else
		@errors = review.errors.full_messages
		erb :'restaurants/show'
	end
end