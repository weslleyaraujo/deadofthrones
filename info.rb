require 'open-uri'
require 'nokogiri'

class Info
  attr_reader :url, :slug, :get

  def initialize slug
    @slug = slug
    @url = 'http://gameofthrones.wikia.com/api.php?action=query&prop=revisions&rvprop=content&format=xml&titles='
    @xml = get
    puts  as_json
    pry
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
      :quote => quote,
      :death => by_match('Death=')
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

        break
      end
    }

    found
  end
end
