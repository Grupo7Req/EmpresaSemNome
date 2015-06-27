class Topic < ActiveRecord::Base
  belongs_to :proposal
  belongs_to :demand

  validates :description, presence: true
  validates :category, presence: true
end
