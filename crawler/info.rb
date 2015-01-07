require 'open-uri'
require 'nokogiri'
require 'pry'

class Info
  attr_reader :url, :slug, :get, :xml

  def initialize slug
    @slug = slug
    @url = 'http://gameofthrones.wikia.com/api.php?action=query&prop=revisions&rvprop=content&format=xml&titles='
    @xml = get
  end

  def get
    Nokogiri::XML(open(@url + @slug)).search('rev').first.children.to_s
  end

  def quote
    @xml.match(/\{\{Quote(.*?)\}\}/)
      .to_s
      .gsub(/\{\{Quote\|/, '')
      .gsub(/\}\}/, '')
      .gsub(/\[\[/, '')
      .gsub(/\]\]/, '')
      .gsub(/(\|(.*$))/, '')
  end

  def as_json
    {
      :quote => quote.strip,
      :death => by_match('Death=').strip,
      :aka => by_match('Aka=').strip,
      :place => by_match('Place=').strip
    }
  end

  def by_match name
    regex = Regexp.new(name)
    found = ''
    @xml.split('|').each { |item|
      if item =~ regex
        found = item.split('=').last
          .gsub(/\[\[/, '')
          .gsub(/\]\]/, '')
        break
      end
    }

    remove_html(found)
  end

  def remove_html value
    value = Nokogiri::HTML.parse(value)
    value.text
      .gsub(/\&.+;/, "")
      .gsub(/<\/?[^>]*>/, "")
      .gsub(/[\n]/, '')
  end
end
