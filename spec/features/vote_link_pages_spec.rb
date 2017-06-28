require 'rails_helper'

describe "the upvote link process" do
  let(:link) {
    Link.create(
      description: "test description",
      link_url: "www.testurl.com",
      user: "Testy McTesterson",
    )
  }

  it "upvotes a link" do

  end

end
