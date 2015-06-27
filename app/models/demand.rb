class Demand < ActiveRecord::Base
  has_many :topics

  validates_presence_of :name, :message => 'Digite um nome para a demanda!'
  validates_presence_of :description, :message => 'Digite uma descrição para a demanda!'
end
