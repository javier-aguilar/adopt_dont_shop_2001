require 'rails_helper'

RSpec.describe Pet, type: :model do
  describe 'validations' do
    it {should validate_presence_of :image}
    it {should validate_presence_of :name}
    it {should validate_presence_of :age}
    it {should validate_presence_of :sex}
    it {should validate_presence_of :description}
    it {should validate_presence_of :status}
    it {should validate_presence_of :shelter_id}
  end

  describe 'relationships' do
    it {should belong_to :shelter}
  end
end