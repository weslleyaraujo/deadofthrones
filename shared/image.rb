class Image

  attr_reader :slug, :url, :xml, :file

  def initialize slug
    config = YAML.load_file('./config/application.yml')

    @slug = slug
    @url = config['crawlers']['image']
    @xml = get
    @file = image_url.split('/').last || ''
    save
  end

  def get
    Nokogiri::XML(open(@url + @slug))
  end

  def image_url
    @xml.search('image').attribute('imageserving').value rescue ''
  end

  def save
    if !image_url.empty?
      open('./public/characters/' + @file, 'wb') do |file|
        file << open(image_url).read
      end
    end
  end

  def as_json
    {
      :image => @file.strip
    }
  end
end
