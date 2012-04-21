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

  describe "#west=" do
    let(:location_1) { Fabricate(:location) }
    let(:location_2) { Fabricate(:location) }

    context "new connection" do

      it "should link location to the west" do
        location_1.west = location_2
        location_1.west.should eq(location_2)
      end

      it "should call #east= on linked location" do
        location_2.should_receive(:east=).with(location_1)
        location_1.west = location_2
      end
    end
    context "finishing the connection" do
      it "should not call #west= on calling location" do
        location_1.west = location_2
        location_1.should_not_receive(:west=)
      end
    end
  end

  describe "#east=" do
    let(:location_1) { Fabricate(:location) }
    let(:location_2) { Fabricate(:location) }

    context "new connection" do

      it "should link location to the east" do
        location_1.east = location_2
        location_1.east.should eq(location_2)
      end

      it "should call #west= on linked location" do
        location_2.should_receive(:west=).with(location_1)
        location_1.east = location_2
      end
    end

    context "finishing the connection" do
      it "should not call #east= on calling location" do
        location_1.east = location_2
        location_1.should_not_receive(:east=)
      end
    end
  end

  describe "#north=" do
    let(:location_1) { Fabricate(:location) }
    let(:location_2) { Fabricate(:location) }

    context "new connection" do

      it "should link location to the north" do
        location_1.north = location_2
        location_1.north.should eq(location_2)
      end

      it "should call #south= on linked location" do
        location_2.should_receive(:south=).with(location_1)
        location_1.north = location_2
      end
    end
    context "finishing the connection" do
      it "should not call #north= on calling location" do
        location_1.north = location_2
        location_1.should_not_receive(:north=)
      end
    end
  end

  describe "#south=" do
    let(:location_1) { Fabricate(:location) }
    let(:location_2) { Fabricate(:location) }

    context "new connection" do

      it "should link location to the north" do
        location_1.south = location_2
        location_1.south.should eq(location_2)
      end

      it "should call #north= on linked location" do
        location_2.should_receive(:north=).with(location_1)
        location_1.south = location_2
      end
    end

    context "finishing the connection" do
      it "should not call #north= on calling location" do
        location_1.north = location_2
        location_1.should_not_receive(:north=)
      end
    end
  end

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
