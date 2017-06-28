
require 'rails_helper'

describe "the delete a link process" do
  let(:link) {
    Link.create(
      description: "test description",
      link_url: "www.testurl.com",
      user: "Testy McTesterson",
    )
  }

  it "deletes a link" do
    visit link_path(link)
    click_link 'Delete'
    expect(page).to have_content('Your link has been DESTROYED!')
  end

end
