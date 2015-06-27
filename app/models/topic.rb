class Topic < ActiveRecord::Base
  belongs_to :proposal
  belongs_to :demand

  validates_presence_of :description, :message => 'Digite uma descrição para o tópico!'
  validates_presence_of :category, :message => 'Digite uma categoria para o tópico!'
end
