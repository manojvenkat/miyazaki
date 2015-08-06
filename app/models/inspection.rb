class Inspection
  include Mongoid::Document
  field :name, type: String
  field :time, type: DateTime

  belongs_to :car_entity
end
