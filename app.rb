require 'rubygems'
require 'sinatra'

# Set Sinatra variables
set :app_file, __FILE__
set :root, File.dirname(__FILE__)
set :views, 'views'
set :public_folder, 'public'

# Application routes
get '/' do
  erb :index
end

get '/foo' do
  content_type :json
  File.read(File.join('./', 'character.example.json'))
end
