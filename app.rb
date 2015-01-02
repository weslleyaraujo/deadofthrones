require 'figaro'
require 'json'
require 'nokogiri'
require 'open-uri'
require 'pry'

require './parseHTML.rb'

@npages = 20
@charurl = 'http://gameofthrones.wikia.com/index.php?action=ajax&articleId=Status%3A+Dead&method=axGetArticlesPage&rs=CategoryExhibitionAjax&page='

1.upto @npages do |n|
  url  = @charurl + n.to_s
  page = Nokogiri::HTML(JSON.parse(open(url).read)['page'])
  page.css('.category-gallery-item').each { |item| 
    ParseHTML.new item.css('a')
  }
end

# http://gameofthrones.wikia.com/api.php?action=imageserving&wisTitle=Jojen_Reed
