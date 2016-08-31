class AddColumnToNoise < ActiveRecord::Migration
  def change
    add_column :noises, :description, :text
  end
end
