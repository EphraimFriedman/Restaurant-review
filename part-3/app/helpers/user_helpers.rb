def current_user
	User.find_by(id: session[:id])	
end

def logged_out?
	redirect '/login' if !current_user 
end