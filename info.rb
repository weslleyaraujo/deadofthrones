require 'open-uri'
require 'nokogiri'

class Info
  attr_reader :url
  attr_reader :slug
  attr_reader :get

  def initialize slug
    @slug = slug
    @url = 'http://gameofthrones.wikia.com/api.php?action=query&prop=revisions&rvprop=content&format=xml&titles='
    @xml = get
    puts by_match 'Death='
    pry
  end

  def get
    Nokogiri::XML(open(@url + @slug)).search('rev').first.children.to_s
  end

  def quote
    @xml.match(/\{\{Quote(.*?)\}\}/).to_s
      .gsub(/\{\{Quote\|/, '')
      .gsub(/\}\}/, '')
      .gsub(/\[\[/, '')
      .gsub(/\]\]/, '')
      .gsub(/(\|(.*$))/, '')
  end

  def as_json
    {
      :quote => quote
    }
  end

  def by_match name
    regex = Regexp.new(name)
    found = ''
    @xml.split('|').reject! { |c| c.empty? }.each { |item|
      if item =~ regex
        found = item.split('=').last
          .gsub(/\[\[/, '')
          .gsub(/\]\]/, '')
      end
    }

    found
  end
end
