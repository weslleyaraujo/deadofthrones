require 'pry'
require 'mongoid'

require './crawler/info.rb'
require './crawler/image.rb'


class Parser
  attr_reader :link, :info, :image

  def initialize link
    @link = link
  end

  def fill
    @info = Info.new slug
    @image = Image.new slug
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

  def data
    [as_json, @info.as_json, @image.as_json].reduce &:merge
  end
end
