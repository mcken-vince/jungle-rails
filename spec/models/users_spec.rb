require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should return an error if password and password_confirmation do not match' do
      @user = User.new(first_name: 'john', last_name: 'doe', email: 'john@doe.com', password: 'super', password_confirmation: 'secret')
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end


    it 'should return an error if email is not given' do
      @user = User.new(first_name: 'john', last_name: 'doe', password: 'secret', password_confirmation: 'secret')
      @user.save
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'should return an error if first_name or last_name is not given' do
      @user = User.new(email: 'john@doe.com', password: 'secret', password_confirmation: 'secret')
      @user.save
      expect(@user.errors.full_messages).to include("First name can't be blank", "Last name can't be blank")
    end


  end
end
