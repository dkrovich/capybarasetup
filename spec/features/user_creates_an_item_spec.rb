require 'rails_helper'

describe "Create a item", :type => feature do
  it "Creates a item" do
    visit "items/new"
    fill_in('item_title', :with => "Add Title Test")
    fill_in('item_text', :with => "Add Text Test")
    click_button('Save item')
    expect(page).to have_content "Add Title Test"
    expect(page).to have_content "Add Text Test"
  end
end
