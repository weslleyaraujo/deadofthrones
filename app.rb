require 'rubygems'
require 'sinatra'
require 'yaml'
require './models/character.rb'

# Set Sinatra variables
set :app_file, __FILE__
set :root, File.dirname(__FILE__)
set :views, 'views'
set :public_folder, 'public'

# Mongoid.load!('./config/database.yml')
Mongoid.load!(YAML.load(ERB.new(File.read('./config/database.yml')).result))

# Application routes
get '/' do
  erb :index
end

get '/character.json' do
  content_type :json
  Character.random
end
