require 'sinatra'
require 'slim'
require 'sass'
require 'sinatra/reloader' if settings.development?

require './song.rb'


set :public_folder, 'assets'
# set :views, 'templates'

get ('/style.css') {scss :style}

get '/' do
	slim :home
end

get '/about' do
	@title = "All about this website"
	slim :about
end

get '/contact' do
	slim :contact
end


get '/fake-error' do
	status 500
	'There is nothing really bad'
end

get '/instance' do
	@name = "DAZ"
	slim :show
end

get '/songs' do
	@songs = Song.all
	slim :songs
end
get '/songs/new' do
	@song = Song.new
	slim :new_song
end

get '/songs/:id' do
	@song = Song.get(params[:id])
	slim :show_song
end

post '/songs' do 
	song = Song.create(params[:song])
	redirect to ("/songs/#{song.id}")
end

get '/songs/:id/edit' do
	@song = Song.get(params[:id])
	slim :edit_song
end

put '/songs/:id' do
	song = Song.get(params[:id])
	song.update(params[:song])
	redirect to("/songs/#{song.id}")
end

delete '/songs/:id' do
	song = Song.get(params[:id])
	song.destroy
	redirect to("/songs")
end

get '/env' do

	if settings.development?
		"development"
	elsif settings.production?
		"production"
	elsif settings.test?
		"test"
	else
		"Who knows what environment you're in!"
	end
end


not_found do
	slim :not_found
end