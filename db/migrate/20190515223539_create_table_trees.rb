class CreateTableTrees < ActiveRecord::Migration[5.2]
  def change
    create_table :trees do |t|
      t.string :species
      t.integer :height
    end
  end
end
