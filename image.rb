class Image
  attr_reader :slug, :url, :xml, :file
  def initialize slug
    @slug = slug
    @url = 'http://gameofthrones.wikia.com/api.php?action=imageserving&format=xml&wisTitle='
    @xml = get
    @file = image_url.split('/').last
    save
  end

  def get
    Nokogiri::XML(open(@url + @slug))
  end

  def image_url
    @xml.search('image').attribute('imageserving').value
  end

  def save
    open('images/' + @file, 'wb') do |file|
      file << open(image_url).read
    end
  end

  def as_json
    {
      :image => @file.strip
    }
  end
end
