require 'rails_helper'

describe Link do
  it { should validate_presence_of :user }
  it { should validate_presence_of :description }
  it { should validate_presence_of :link_url }

  it { should have_many :comments }

  let(:link1) {
    Link.create(
      description: "test description",
      link_url: "www.testurl.com",
      user: "Testy McTesterson",
    )
  }
  let(:link2) {
    Link.create(
      description: "test2 description",
      link_url: "www.testurl2.com",
      user: "2 Testy",
    )
  }

  describe ".ascending_by_rank" do
    it "sorts with lowest ranked links first" do
      link1
      link2.rank = 2
      link2.save
      expect(Link.ascending_by_rank.first.description).to eq(link1.description)
    end
  end

  describe ".descending_by_rank" do
    it "sorts with highest ranked links first" do
      link1
      link2.rank = 2
      link2.save
      expect(Link.descending_by_rank.first.description).to eq(link2.description)
    end
  end
  describe ".sort_by_oldest" do
    it "sorts with oldest links first" do
      link1
      link2
      expect(Link.sort_by_oldest.first.description).to eq(link1.description)
    end
  end
  describe ".sort_by_newest" do
    it "sorts with newest links first" do
      link1
      link2
      expect(Link.sort_by_newest.first.description).to eq(link2.description)
    end
  end
  describe ".sort_by_most_popular" do
    it "sorts with most commented links first" do
      link1.comments.create(user: "test user", comments: "hello")
      link2
      expect(Link.sort_by_most_popular.first.description).to eq(link1.description)
    end
  end
  describe ".sort_by_least_popular" do
    it "sorts with least commented links first" do
      link1.comments.create(user: "test user", comments: "hello")
      link1.comments.create(user: "test user", comments: "hello")
      link2.comments.create(user: "test user", comments: "hello")
      expect(Link.sort_by_least_popular.first.description).to eq(link2.description)
    end
  end
end
