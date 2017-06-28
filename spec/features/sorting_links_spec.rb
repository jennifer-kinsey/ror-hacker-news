# find a good way to integration test the order of elements

# require 'rails_helper'
#
# describe "the sorting link process" do
#   let(:link1) {
#     Link.create(
#       description: "test description",
#       link_url: "www.testurl.com",
#       user: "Testy McTesterson",
#     )
#   }
#   let(:link2) {
#     Link.create(
#       description: "test2 description",
#       link_url: "www.testurl2.com",
#       user: "2 Testy",
#     )
#   }
#
#  WARNING: the code below does not work! it always passes. :(
#
#   it "sorts by newest to oldest" do
#     visit root_path
#     click_link "unpopular"
#     RSpec::Matchers.define :appear_before do |later_content|
#       match do |earlier_content|
#         page.body.index(link1.description) < page.body.index(link2.description)
#       end
#     end
#   end
#
#
#   it "sorts by oldest to newest" do
#     visit root_path
#     click_link "popular"
#     RSpec::Matchers.define :appear_before do |later_content|
#       match do |earlier_content|
#         page.body.index(link1.description) < page.body.index(link2.description)
#       end
#     end
#   end
# end
