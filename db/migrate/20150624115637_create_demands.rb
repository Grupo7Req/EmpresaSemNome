class CreateDemands < ActiveRecord::Migration
  def change
    create_table :demands do |t|
      t.string :name
      t.text :description
      t.timestamps null: false
    end
  end
end
