class AddAcceptedToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :accepted, :boolean
  end
end
