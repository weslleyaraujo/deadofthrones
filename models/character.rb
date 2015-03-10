require 'mongoid'

class Character
  include Mongoid::Document

  field :quote,   type: String
  field :death,   type: String
  field :url,     type: String
  field :title,   type: String
  field :slug,    type: String
  field :image,   type: String
  field :aka,     type: String
  field :place,   type: String

  class << self
    def random
      self.where(:quote.ne => '').sample.to_json
    end
  end
end
