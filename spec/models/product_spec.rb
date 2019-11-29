require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    # before do
    #   @category = Category.create(name: 'Furniture')
    #   @product = @category.products.create({
    #     name: 'Paint',
    #     description: 'Waves',
    #     quantity: 14,
    #     price: 888
    #   })
    # end

    it 'should have a name' do
      @category = Category.create(name: 'Furniture')
      @product = @category.products.create({
        name: 'Paint',
        description: nil,
        quantity: nil,
        price: nil
      })
      expect(@product.name.present?).to eq(true);
      expect(@product.errors.full_messages.present?).to eq(true);
    end
    it 'should have a price' do
      @category = Category.create(name: 'Furniture')
      @product = @category.products.create({
        name: nil,
        description: nil,
        quantity: nil,
        price: 888,
        # category: art
      });
      expect(@product.price.present?).to eq(true);
      expect(@product.errors.full_messages.present?).to eq(true);
    end
    it 'should have a quantity' do
      @category = Category.create(name: 'Furniture')
      @product = @category.products.create({
        name: nil,
        description: nil,
        quantity: 14,
        price: nil
      })
      expect(@product.quantity.present?).to eq(true);
      expect(@product.errors.full_messages.present?).to eq(true);
    end
    it 'should have a category' do
      @category = Category.create(name: 'Furniture')
      @product = @category.products.create({
        name: 'Paint',
        description: 'Waves',
        quantity: 14,
        price: 888,
        category: nil,
      })
      expect(@product.category.present?).to eq(true);
      expect(@product.category.errors.full_messages.present?).to eq(false)
    end
  end
end