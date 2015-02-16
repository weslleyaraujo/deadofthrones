require 'rubygems'
require 'sinatra'
require './crawler/character.rb'

# load mongoid config
Mongoid.load!('./config/mongoid.yml')

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
  Character.all.sample.to_json
end
