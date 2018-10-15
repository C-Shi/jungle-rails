require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    context "valid name" do
      it "should be invalid if no name provided" do
        @category = Category.new({name: "pet"})
        @category.save
        @product = Product.new
        @product.price = 15
        @product.quantity = 15
        @product.category = @category
        @product.save
        expect(@product).not_to be_valid
      end
    end

    context "valid price" do
      it "should be invalid if no price is present" do
        @category = Category.new({name: "pet"})
        @category.save
        @product = Product.new
        @product.name = "Cat Food"
        @product.quantity = 15
        @product.category = @category
        @product.save
        expect(@product).not_to be_valid
      end
    end

    context "valid quantity" do
      it "should be invalid if no quanitity provided" do
        @category = Category.new({name: "pet"})
        @category.save
        @product = Product.new
        @product.name = "Cat Food"
        @product.price = 15
        @product.category = @category
        @product.save
        expect(@product).not_to be_valid
      end
    end

    context "valid category" do
      it "should be invalid if there is no category" do
        @category = Category.new({name: "pet"})
        @category.save
        @product = Product.new
        @product.name = "Cat Food"
        @product.price = 15
        @product.quantity = 15
        @product.save
        expect(@product).not_to be_valid
      end
    end

    it "should be valid nothing wrong" do
      @category = Category.new({name: "pet"})
      @category.save
      @product = Product.new
      @product.name = "Cat Food"
      @product.price = 15
      @product.quantity = 15
      @product.category = @category
      @product.save
      expect(@product).to be_valid
    end

  end
end
