require 'json'
require 'nokogiri'
require 'open-uri'
require 'yaml'

require './shared/parser.rb'
require './shared/logger.rb'
require './shared/pages.rb'
require './models/character.rb'

Mongoid.load!('./config/database.yml')
config = YAML.load_file('./config/application.yml')

pages = Pages.new
service = config['crawlers']['character']

1.upto pages.total do |n|
  url  = service + n.to_s
  page = Nokogiri::HTML(JSON.parse(open(url).read)['page'])

  page.css('.category-gallery-item').each { |item| 
    parsed = Parser.new item.css('a')
    if Character.where(slug: parsed.slug).count == 0
      parsed.fill
      Character.create parsed.data

      @logger.info("Created character: #{parsed.as_json[:title]}")
    else
      @logger.warn("Character already found in database: #{parsed.as_json[:title]}")
    end
  }
end

@logger.info("Crawler complete! #{Character.count} characters in your database.")
