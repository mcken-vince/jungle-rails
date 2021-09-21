require 'rails_helper'


RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should save successfully when given all required fields' do
      @category = Category.new(name: 'test')
      @product = @category.products.new(name: 'product', price: 1, quantity: 10)
      @product.save! # this will fail if product does not save successfully
    end

    it 'should return an error if name field is not given' do
      @category = Category.new(name:'test')
      @product = @category.products.new(price: 1, quantity: 10)
      @product.save
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should return an error if price field is not given' do
      @category = Category.new(name:'test')
      @product = @category.products.new(name: 'product', quantity: 10)
      @product.save
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'should return an error if quantity field is not given' do
      @category = Category.new(name:'test')
      @product = @category.products.new(name: 'product', price: 1)
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should return an error if category field is not given' do
      @product = Product.new(name: 'product', price: 1, quantity: 10)
      @product.save
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
