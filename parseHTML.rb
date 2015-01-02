require 'pry'
require './info.rb'

class ParseHTML
  attr_reader :link
  attr_reader :info

  def initialize link
    @link = link
    @info = Info.new as_json[:slug]
  end

  def as_json
    {
      :url => @link.attribute('href').value,
      :title => @link.attribute('title').value,
      :slug => @link.attribute('href').value.split('/').last
    }
  end
end
