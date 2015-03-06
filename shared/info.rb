require 'open-uri'
require 'nokogiri'

class Info

  attr_reader :url, :slug, :get, :xml

  def initialize slug
    config = YAML.load_file('./config/application.yml')
    @url = config['crawlers']['info']

    @slug = slug
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
