require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'user validation' do
    
    it 'is valid with valid parameters' do
      user = User.new(name:"test",email:"test@gmail.com",password:"test#123")
      expect(user).to be_valid
    end

    it 'is not valid without a name' do
      user = User.new(email:"test@gmail.com",password:"test#123")
      expect(user).to_not be_valid
    end

    it 'is not valid without an email' do
      user = User.new(name:"test",password:"test#123")
      expect(user).to_not be_valid
    end

  end
end
