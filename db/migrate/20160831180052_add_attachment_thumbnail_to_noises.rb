class AddAttachmentThumbnailToNoises < ActiveRecord::Migration
  def self.up
    change_table :noises do |t|
      t.attachment :thumbnail
    end
  end

  def self.down
    remove_attachment :noises, :thumbnail
  end
end
