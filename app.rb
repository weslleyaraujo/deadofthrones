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

  serve '/assets/javascripts', from: 'public/assets/javascripts/'
  serve '/assets/css', from: 'public/assets/css/'
  serve '/assets/bower_components', from: 'public/assets/bower_components/'
  serve '/assets/fonts', from: 'public/assets/fonts/'

  js :application, '/assets/javascripts/application.js', [
    '/assets/bower_components/jquery/dist/jquery.js',
    '/assets/bower_components/angular/angular.js',
    '/assets/javascripts/boot.js',
    '/assets/javascripts/config.js',
    '/assets/javascripts/shared/services/getCharacter.js',
    '/assets/javascripts/shared/filters/clearName.js',
    '/assets/javascripts/shared/directives/goTo.js',
    '/assets/javascripts/shared/directives/characterImage.js',
    '/assets/javascripts/modules/characters/characterCtrl.js'
  ]

  css :application, '/assets/css/application.css', [
    '/assets/bower_components/animate.css/animate.css',
    '/assets/fonts/armantic/stylesheet.css',
    '/assets/fonts/deadfontwalking/stylesheet.css',
    '/assets/css/main.css'
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
