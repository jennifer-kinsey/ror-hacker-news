require 'rails_helper'

describe "the upvote link process" do
  let(:link) {
    Link.create(
      description: "test description",
      link_url: "www.testurl.com",
      user: "Testy McTesterson",
    )
  }

  before do
    link.rank = 0
    link.save
  end

  it "upvotes a link" do
    visit root_path
    click_link "Up Vote"
    expect(page).to have_content "1 point"
  end

end
