class RenameDescriptionToCommentInReviews < ActiveRecord::Migration[7.1]
  def change
    rename_column :reviews, :description, :comment
  end
end
