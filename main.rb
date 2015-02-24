require 'sinatra'
require 'sinatra/reloader' if development?

set :public_folder, 'assets'
# set :views, 'templates'

get '/' do
	erb :home
end

get '/about' do
	@title = "All about this website"
	erb :about
end

get '/contact' do
	erb :contact
end

not_found do
	erb :not_found
end

get '/fake-error' do
	status 500
	'There is nothing really bad'
end

get '/instance' do
	@name = "DAZ"
	erb :show
end