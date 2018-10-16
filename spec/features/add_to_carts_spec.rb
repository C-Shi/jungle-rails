require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js:true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99,
        image: open_asset('apparel1.jpg')
      )
    end
  end

  scenario "should see cart goes from 0 to 1" do
    visit root_path

    find("footer form[action='/cart/add_item?product_id=1'] button").click

    cart = find("a[href='/cart']")

    expect(cart).to have_content "1"

    save_screenshot
  end
end
