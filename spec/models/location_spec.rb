require 'spec_helper'

describe Location do

  it "validate uniqueness of #name" do
    Fabricate(:location)
    should validate_uniqueness_of(:name)
  end

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should belong_to(:north) }
  it { should belong_to(:south) }
  it { should belong_to(:east) }
  it { should belong_to(:west) }

  describe "#unlinked_locations" do
    let!(:location_1) { Fabricate(:location) }
    let!(:location_2) { Fabricate(:location) }
    let!(:location_3) { Fabricate(:location) }
    let!(:location_4) { Fabricate(:location) }
    let!(:location_5) { Fabricate(:location) }
    
    before do
      location_1.north = location_2
    end

    it "returns non linked locations" do
      unlinked = location_1.unlinked_locations
      unlinked.should include(location_3)
      unlinked.should include(location_4)
      unlinked.should include(location_5)
    end

    it "does not return linked locations" do
      unlinked = location_1.unlinked_locations
      unlinked.should_not include(location_2)
    end

    it "does not return self" do
      unlinked = location_1.unlinked_locations
      unlinked.should_not include(location_1)
    end

    it "location has no linked locations" do
      unlinked = location_3.unlinked_locations
      unlinked.should include(location_4)
      unlinked.should include(location_1)
      unlinked.should include(location_5)
      unlinked.should include(location_2)
    end
  end

end
