require 'rails_helper'

describe "the edit link process" do
  let(:link) {
    Link.create(
      description: "test description",
      link_url: "www.testurl.com",
      user: "Testy McTesterson",
    )
  }

  it "updates the link" do
    visit edit_link_path(link)
    fill_in 'Description', :with => 'fancy test description'
    fill_in 'Link url', :with => 'www.fancyurl.com'
    fill_in 'User', :with => 'Fancy McTesterson'
    click_on 'Update Link'
    expect(page).to have_content 'Your link has been ...updated'
  end

  it "throws an error if there is blank data" do
    visit edit_link_path(link)
    fill_in 'Description', :with => ''
    click_on 'Update Link'
    expect(page).to have_content 'errors'
  end

end
