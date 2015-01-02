require 'pry'

require 'open-uri'
require 'nokogiri'

x = Nokogiri::XML(open('http://gameofthrones.wikia.com/api.php?action=query&prop=revisions&rvprop=content&format=xml&titles=Joffrey_Baratheon'))
x = x.search('rev')
x = x.

quote = x.match(/\{\{Quote(.*?)\}\}/)
quote = quote.to_s.gsub(/\{\{Quote\|/, '').gsub(/\}\}/, '').gsub(/\[\[/, '').gsub(/\]\]/, '')

# if has | 
# quote.split('|').first

x = x.split('|').reject! { |c| c.empty? }

x.each { |item| 
  puts '*=*'*10
  puts item
  puts '*=*'*10
}

pry
