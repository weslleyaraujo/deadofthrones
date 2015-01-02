require 'pry'
require 'nokogiri'
require 'open-uri'

require './parseHTML.rb'

page = Nokogiri::HTML(open("http://gameofthrones.wikia.com/wiki/Category:Status:_Dead"))

page.css('.category-gallery-item').each { |item| 
  ParseHTML.new item.css('a')
}
