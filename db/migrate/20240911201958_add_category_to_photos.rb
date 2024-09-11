class AddCategoryToPhotos < ActiveRecord::Migration[7.1]
  def change
    add_column :photos, :category, :string
  end
end
