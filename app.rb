require 'rubygems'
require 'sinatra'
require 'sinatra/assetpack'
require 'yaml'
require './models/character.rb'

# Set Sinatra variables
set :app_file, __FILE__
set :root, File.dirname(__FILE__)
set :views, 'views'
set :public_folder, 'public'

# assetpack
register Sinatra::AssetPack
assets {

  js :application, '/assets/javascripts/application.js', [
    '/assets/javascripts/application.min.js'
  ]

  css :application, '/assets/css/application.css', [
    '/assets/css/application.min.css'
  ]
}

Mongoid.load!('./config/mongoid.yml')

# Application routes
get '/' do
  erb :index
end

get '/character.json' do
  content_type :json
  Character.random
end
