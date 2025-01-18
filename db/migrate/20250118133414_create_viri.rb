class CreateViri < ActiveRecord::Migration[7.1]
  def change
    create_table :viri do |t|
      t.string :name
      t.string :description
      t.decimal :price
      t.integer :contagion_rate
      t.string :symptom_severity
      t.integer :incubation_period
      t.integer :duration
      t.string :region
      t.string :vaccine_availability
      t.string :image_url

      t.timestamps
    end
  end
end
