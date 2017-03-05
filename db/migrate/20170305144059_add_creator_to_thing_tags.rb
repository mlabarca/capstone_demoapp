class AddCreatorToThingTags < ActiveRecord::Migration
  def change
    add_reference :thing_tags, :creator, index: true, foreign_key: true
  end
end
