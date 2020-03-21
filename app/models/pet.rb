class Pet < ApplicationRecord
  validates_presence_of :image, :name, :age, :sex, :status, :description, :shelter_id
  belongs_to :shelter
end