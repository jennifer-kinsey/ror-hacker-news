require 'rails_helper'

describe Link do
  it { should validate_presence_of :user }
  it { should validate_presence_of :description }
  it { should validate_presence_of :link_url }

  it { should have_many :comments }
end
