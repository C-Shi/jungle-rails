require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
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

  scenario "They should go to product detail page" do
    # Action
    visit root_path
    find("footer a.btn-default[href='/products/1']").click
    # within('.products .product:last-child') { click_on 'Details »' }
    expect(page).to have_content('Comment Section')
  end
end
