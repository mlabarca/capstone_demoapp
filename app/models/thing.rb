class Thing < ActiveRecord::Base
  include Protectable
  validates :name, :presence=>true

  has_many :thing_images, inverse_of: :thing, dependent: :destroy
  has_many :tags, through: :thing_tags
  has_many :thing_tags

  scope :not_linked, ->(image) { where.not(:id=>ThingImage.select(:thing_id)
    .where(:image=>image)) }
  scope :from_tags, ->(tag_ids) { joins(:thing_tags)
    .where('thing_tags.tag_id = ALL (array[?])', tag_ids.map(&:to_i)) if tag_ids.present?}
end
