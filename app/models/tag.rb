class Tag < ActiveRecord::Base
  has_many :things, through: :thing_tag
  has_many :thing_tags
end
