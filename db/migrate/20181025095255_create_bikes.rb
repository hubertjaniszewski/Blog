class CreateBikes < ActiveRecord::Migration[5.2]
  def change
    create_table :bikes do |t|
      t.string :brand
      t.integer :wheels
      t.string :color
      t.integer :year_of_production
    end
  end
end
