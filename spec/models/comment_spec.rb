require 'rails_helper'

describe Comment do
  it { should validate_presence_of :user }
  it { should validate_presence_of :comments }

  it { should belong_to :link }
end
