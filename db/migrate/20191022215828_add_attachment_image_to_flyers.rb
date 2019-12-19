class AddAttachmentImageToFlyers < ActiveRecord::Migration
  def self.up
    change_table :flyers do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :flyers, :image
  end
end
