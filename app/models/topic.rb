class Topic < ActiveRecord::Base
  belongs_to :proposal
  belongs_to :demand
end
