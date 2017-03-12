class ThingTag < ActiveRecord::Base
  belongs_to :thing
  belongs_to :tag
  belongs_to :creator, class_name: 'User'
end
