require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should return an error if password and password_confirmation do not match' do
      @user = User.new(first_name: 'john', last_name: 'doe', email: 'john@doe.com', password: 'super', password_confirmation: 'secret')
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'should successfully save' do
      @user = User.new(first_name: 'john', last_name: 'doe', email: 'john@doe.com', password: 'secret', password_confirmation: 'secret')
      @user.save!
    end
    it 'should not create a new user with an email that exists in the database, case insensitive' do
      @user1 = User.new(first_name: 'john', last_name: 'doe', email: 'john@doe.com', password: 'yessir', password_confirmation: 'yessir')
      @user1.save
      @user2 = User.new(first_name: 'johnny', last_name: 'doesly', email: 'JOHN@DOE.com', password: 'nopers', password_confirmation: 'nopers')
      @user2.save
      expect(@user2.errors.full_messages).to include("Email has already been taken")
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

    context 'when user account is being created' do
      it 'should return an error if password is under 5 characters' do
        @user = User.new(first_name: 'john', last_name: 'doe', email: 'john@doe.com', password: 'tiny', password_confirmation: 'tiny')
        @user.save
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 5 characters)')
      end
      it 'should save if password is 5 characters or more' do
        @user = User.new(first_name: 'john', last_name: 'doe', email: 'john@doe.com', password: 'bigger', password_confirmation: 'bigger')
        @user.save!
        
      end
    end

  end
end
