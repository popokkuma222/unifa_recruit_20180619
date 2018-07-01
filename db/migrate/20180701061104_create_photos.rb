class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :title
      t.integer :created_by
      t.timestamp :created_at

      t.timestamps
    end
  end
end
