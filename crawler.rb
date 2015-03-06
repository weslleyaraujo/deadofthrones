require 'json'
require 'nokogiri'
require 'open-uri'
require 'mongoid'
require 'yaml'

require './shared/parser.rb'
require './shared/logger.rb'
require './models/character.rb'

Mongoid.load!('./config/mongoid.yml')
@config = YAML.load_file('./config/application.yml')

@npages = @config['pages']
@charurl = @config['char_url']

1.upto @npages do |n|
  url  = @charurl + n.to_s
  page = Nokogiri::HTML(JSON.parse(open(url).read)['page'])
  page.css('.category-gallery-item').each { |item| 
    @parsed = Parser.new item.css('a')
    if Character.where(slug: @parsed.slug).count == 0
      @parsed.fill
      Character.create @parsed.data
      @logger.info("Success::Created character: #{@parsed.as_json[:title]}")
    else
      @logger.warn("Warn::Cracter already found in database : #{@parsed.as_json[:title]}")
    end
  }
end
