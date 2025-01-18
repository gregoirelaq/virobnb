class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :virus, null: false, foreign_key: true
      t.string :title
      t.string :description
      t.integer :rate

      t.timestamps
    end
  end
end
