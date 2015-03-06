require 'open-uri'
require 'nokogiri'
require 'yaml'

class Pages

  attr_reader :total

  def initialize
    config = YAML.load_file('./config/application.yml')
    @url = config['crawlers']['pages']
    @page = get

    @total = count_pages
  end

  def get
    Nokogiri::HTML(open(@url))
  end

  def count_pages
    @page.css('.wikia-paginator .paginator-page').last.text.to_i
  end

end
