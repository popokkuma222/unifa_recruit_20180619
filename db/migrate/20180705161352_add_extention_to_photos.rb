class AddExtentionToPhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :photos, :extention, :string
  end
end
