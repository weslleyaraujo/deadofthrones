class Image
  attr_reader :slug, :url, :xml, :file
  def initialize slug
    @slug = slug
    @url = 'http://gameofthrones.wikia.com/api.php?action=imageserving&format=xml&wisTitle='
    @xml = get
    @file = image_url.split('/').last || ''
    save
  end

  def get
    Nokogiri::XML(open(@url + @slug))
  end

  def image_url
    begin
      @xml.search('image').attribute('imageserving').value
    rescue
      ''
    end
  end

  def save
    if !image_url.empty?
      open('./crawler/images/' + @file, 'wb') do |file|
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
