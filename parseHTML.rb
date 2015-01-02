require 'pry'
require 'nokogiri'

class ParseHTML
  @@link

  def initialize link
    @@link = link
    puts to_json
  end

  def to_json
    {
      :url => @@link.attribute('href').value,
      :title => @@link.attribute('title').value
    }
  end
end
