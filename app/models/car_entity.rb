class CarEntity
  include Mongoid::Document
  field :name, type: String
  field :year, type: Integer
  field :fuel_type, type: String
  field :mileage, type: Integer
  field :reg_no, type: String
  field :listing_price, type: Integer

  belongs_to :car_model
  has_one :inspections
  has_one :sellers
end
