class AddIsPublishedFlagToCreatures < ActiveRecord::Migration[6.1]
  def change
    add_column :creatures, :is_published_flag, :boolean, null: true, default: false
  end
end
