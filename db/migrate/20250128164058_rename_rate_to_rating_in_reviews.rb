class RenameRateToRatingInReviews < ActiveRecord::Migration[7.1]
  def change
    rename_column :reviews, :rate, :rating
  end
end
