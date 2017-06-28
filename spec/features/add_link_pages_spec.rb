require 'rails_helper'

describe "the add a link process" do
  it "adds a new link" do
    visit root_path
    click_link 'Add'
    fill_in 'Description', :with => 'test description'
    fill_in 'Link url', :with => 'test url'
    fill_in 'User', :with => 'test user'
    click_on 'Create Link'
    expect(page).to have_content 'Your link has been SAVED'
  end

  it "gives error when no name is entered" do
    visit new_link_path
    click_on 'Create Link'
    expect(page).to have_content 'Please fix these errors:'
  end
end
