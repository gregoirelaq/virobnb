class RemoveTitleFromReviews < ActiveRecord::Migration[7.1]
  def change
    remove_column :reviews, :title, :string
  end
end
