require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'should validate a user' do
      user = User.create(name: "Jo", email: "jo@gmail.com", password: "1234")
      expect(user).to validate_presence_of(:name)
      expect(user).to validate_presence_of(:email)
      expect(user).to validate_uniqueness_of(:email)
    end
  end

  describe 'relationships' do
    it {should have_many :favorites}
  end
end