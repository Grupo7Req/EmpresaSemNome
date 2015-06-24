class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.text :description
      t.string :category
      t.text :notes

      t.belongs_to :demand
      t.belongs_to :proposal

      t.timestamps null: false
    end
  end
end
