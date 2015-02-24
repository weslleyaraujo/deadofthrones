require 'rubygems'
require 'sinatra'

# Set Sinatra variables
set :app_file, __FILE__
set :root, File.dirname(__FILE__)
set :views, 'views'
set :public_folder, 'public'

require 'mongoid'
require './crawler/character.rb'
Mongoid.load!('./config/mongoid.yml')

# Application routes
get '/' do
  erb :index
end

get '/foo' do
  content_type :json
  Character.where(:quote.ne => '', :image.ne => '').sample.to_json
end
