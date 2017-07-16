class AddPictureToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :picture, :string
  end
end
