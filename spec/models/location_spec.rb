require 'spec_helper'

describe Location do

  it "validate uniqueness of #name" do
    Fabricate(:location)
    should validate_uniqueness_of(:name)
  end

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }

end
