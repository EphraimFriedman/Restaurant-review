def current_user
	User.find_by(id: session[:id])	
end

def logged_out?
	redirect '/login/new' if !current_user 
end

