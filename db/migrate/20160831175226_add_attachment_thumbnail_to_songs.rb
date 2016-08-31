class AddAttachmentThumbnailToSongs < ActiveRecord::Migration
  def self.up
    change_table :songs do |t|
      t.attachment :thumbnail
    end
  end

  def self.down
    remove_attachment :songs, :thumbnail
  end
end
