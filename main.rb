require 'sinatra'
require 'slim'
require 'sinatra/reloader' if development?

set :public_folder, 'assets'
# set :views, 'templates'

get '/' do
	slim :home
end

get '/about' do
	@title = "All about this wpebsite"
	slim :about
end

get '/contact' do
	slim :contact
end

not_found do
	slim :not_found
end

get '/fake-error' do
	status 500
	'There is nothing really bad'
end

get '/instance' do
	@name = "DAZ"
	slim :show
end