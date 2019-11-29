require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
  
    it 'has a user password' do
      @user = User.create(first_name: 'Dany', last_name: 'Targaryen', email: 'mother@dragons.com', password: 'notmad', confirm_password: 'notmad')
      expect(@user.password).to eq(true);
    end

    it 'has a user password confirmation' do
      @user = User.create(first_name: 'Dany', last_name: 'Targaryen', email: 'mother@dragons.com', password: 'notmad', confirm_password: 'notmad')
      expect(@user.confirm_password).to eq(true);
    end
  
    it 'has a valid password of more than 5 characters' do
      @user = User.create(first_name: 'Dany', last_name: 'Targaryen', email: 'mother@dragons.com', password: 'notmad', confirm_password: 'notmad')
      expect(@user.password.length > 5).to eq(true);
    end
    
    it 'has a user password and confirmation as the same value' do
      @user = User.create(first_name: 'Dany', last_name: 'Targaryen', email: 'mother@dragons.com', password: 'notmad', confirm_password: 'notmad')
      expect(@user.confirm_password === @user.password).to eq(true);
    end

    it 'has a unique user email' do
      @user1 = User.create(first_name: 'Dany', last_name: 'Targaryen', email: 'mother@dragons.com', password: 'notmad', confirm_password: 'notmad')
      expect(@user).to eq(true);
      @user2 = User.create(first_name: 'Dany', last_name: 'Targaryen', email: 'mother@DRAGONS.com', password: 'notmad', confirm_password: 'notmad')
      expect(@user).to_not be_valid
    end

    it 'has a first name' do
      @user = User.create(first_name: 'Dany', last_name: 'Targaryen', email: 'mother@dragons.com', password: 'notmad', confirm_password: 'notmad')
      expect(@user.first_name).to eq(true);
    end

    it 'has a last name' do
      @user = User.create(first_name: 'Dany', last_name: 'Targaryen', email: 'mother@dragons.com', password: 'notmad', confirm_password: 'notmad')
      expect(@user.first_name).to eq(true);
    end
    
  end

  describe '.authenticate_with_credentials' do

    it 'authenticates user email' do
      @user = User.create(first_name: 'Dany', last_name: 'Targaryen', email: 'mother@dragons.com', password: 'notmad', confirm_password: 'notmad')
      expect(User.authenticate_with_credentials("mother@dragons.com", "notmad").present?).to eq(true)
    end

    it 'authenticates user password' do
      @user = User.create(first_name: 'Dany', last_name: 'Targaryen', email: 'mother@dragons.com', password: 'notmad', confirm_password: 'notmad')
      expect(User.authenticate_with_credentials("mother@dragons.com", "notmad").present?).to eq(true)
    end

    it 'allows login if user adds space before or after email' do
      @user = User.create(first_name: 'Dany', last_name: 'Targaryen', email: 'mother@dragons.com', password: 'notmad', confirm_password: 'notmad')
      expect(User.authenticate_with_credentials("     mother@dragons.com", "notmad").present?).to eq(true)
    end

    it 'allows login if user email disregarding case sensitivity' do
      @user = User.create(first_name: 'Dany', last_name: 'Targaryen', email: 'mother@dragons.com', password: 'notmad', confirm_password: 'notmad')
      expect(User.authenticate_with_credentials("mOthER@DRAgons.com", "notmad").present?).to eq(true)
    end

  end

end
