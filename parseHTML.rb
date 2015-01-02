require 'pry'
require './info.rb'
require './image.rb'

class ParseHTML
  attr_reader :link, :info

  def initialize link
    @link = link
    @info = Info.new slug
    @image = Image.new slug
    pry
  end

  def as_json
    {
      :url => @link.attribute('href').value.strip,
      :title => @link.attribute('title').value.strip,
      :slug => slug
    }
  end

  def slug
    @link.attribute('href').value.split('/').last
  end
end
