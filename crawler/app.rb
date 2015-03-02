require 'json'
require 'nokogiri'
require 'open-uri'
require 'pry'
require 'mongoid'

require './crawler/parser.rb'
require './models/character.rb'

Mongoid.load!('./config/mongoid.yml')

@npages = 20
@charurl = 'http://gameofthrones.wikia.com/index.php?action=ajax&articleId=Status%3A+Dead&method=axGetArticlesPage&rs=CategoryExhibitionAjax&page='
@parsed

1.upto @npages do |n|
  url  = @charurl + n.to_s
  page = Nokogiri::HTML(JSON.parse(open(url).read)['page'])
  page.css('.category-gallery-item').each { |item| 
    @parsed = Parser.new item.css('a')
    if Character.where(slug: @parsed.slug).count == 0
      @parsed.fill
      Character.create @parsed.data

      puts 'CREATED CHARACTER ============================================'
      puts @parsed.data.inspect
      puts '===' * 15
    end
  }
end
