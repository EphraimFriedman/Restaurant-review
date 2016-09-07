get '/users/new' do
	
	erb :'users/new'
end

post '/users' do
	user = User.new(params[:user])

	if user.save
		session[:id] = user.id
		redirect '/restaurants'
	else
		@errors = user.errors.full_messages
		erb :'users/new'
	end 
end

get '/login/new' do

	erb :'users/login'
end

post '/login' do
	user = User.find_by(email: params[:email])

	if user && user.authenticate(params[:password])
		session[:id] = user.id
		redirect '/restaurants'
	else
		@errors = ['invalid email/password']
		erb :'users/login'
	end 
end

get '/logout' do
	session.clear

	redirect '/restaurants'
end