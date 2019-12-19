class CreateFlyers < ActiveRecord::Migration
  def change
    create_table :flyers do |t|
      t.string :title
      t.text :description
      t.string :is_live
      t.text :uploader
      t.string :is_live, :default => '1'
      t.string :location
      t.string :image_file
      t.datetime :event_date
      t.datetime :display_date
      t.integer :custFlyer
      t.string :defaultBg
      # Add fields that let Rails automatically keep track
      # of when movies are added or modified:
      t.timestamps
    end
  end
end
