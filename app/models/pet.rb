class Pet < ApplicationRecord
  validates_presence_of :image, :name, :age, :sex, :shelter_id
  belongs_to :shelter
end