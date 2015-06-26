class AddSentToTopics < ActiveRecord::Migration
  def change
  	add_column :topics, :sent, :boolean
  end
end
