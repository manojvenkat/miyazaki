class CarModel
  include Mongoid::Document
  field :name
  field :model_name
  field :model_make

  has_many :car_entities
end
