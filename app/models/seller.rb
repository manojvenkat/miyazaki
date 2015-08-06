class Seller
  include Mongoid::Document
  field :name, type: String
  field :email, type: String

  belongs_to :car_entity
end
