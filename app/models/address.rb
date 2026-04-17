# attributes
# title: String
# address1: String ,address2: String , city: String ,zip: String , country: String
# lat: Float , lng: Float
# addressable_type , addressable_id
class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true

  enum :type, billing: "billing", location: "location"

  # Validations
  validates :title, presence: true, length: { minimum: 4 }
  validates :address1, presence: true
  validates :city, presence: true, length: { minimum: 2 }
  validates :country, presence: true
  # validates :type, inclusion: { in: ADDRESS_TYPES.values }
  validates :directions, length: { minimum: 8, maximum: 200 }, allow_nil: true
end
