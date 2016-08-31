class AddAttributesToSong < ActiveRecord::Migration
  def change
    add_column :songs, :title, :string
    add_column :songs, :description, :text
    add_column :songs, :itunes, :string
    add_column :songs, :lastfm, :string
    add_column :songs, :website, :string
  end
end
