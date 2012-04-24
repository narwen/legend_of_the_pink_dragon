require_relative "../../app/models/location_linker"

describe LocationLinker do
  let(:location_1) { double }
  let(:location_2) { double }

  before do
    location_1.stub(:save).and_return(true)
    location_2.stub(:save).and_return(true)
  end

  describe ".link_north_south" do
    it "should set locations north and south" do
      location_1.should_receive(:north=).with(location_2)
      location_2.should_receive(:south=).with(location_1)
      LocationLinker.should_receive(:unlink_location).with(location_1, "north")
      LocationLinker.should_receive(:unlink_location).with(location_2, "south")
      LocationLinker.link_north_south(location_1, location_2)
    end
  end

  describe ".link_east_west" do
    it "should set locations east and west" do
      location_1.should_receive(:east=).with(location_2)
      location_2.should_receive(:west=).with(location_1)
      LocationLinker.should_receive(:unlink_location).with(location_1, "east")
      LocationLinker.should_receive(:unlink_location).with(location_2, "west")
      LocationLinker.link_east_west(location_1, location_2)
    end
  end

  describe ".unlink_location" do
    context "north" do
      it "reset the northern connection" do
        location_3 = double
        location_1.stub(:north).and_return(location_3)
        location_3.should_receive(:south=).with(nil)
        location_3.should_receive(:save)
        LocationLinker.unlink_location(location_1, "north")
      end

      it "does not throw an error" do
        location_1.stub(:north).and_return(nil)
        lambda { LocationLinker.unlink_location(location_1, "north") }.should_not raise_error
      end
    end

    context "south" do
      it "reset the southern connection" do
        location_3 = double
        location_1.stub(:south).and_return(location_3)
        location_3.should_receive(:north=).with(nil)
        location_3.should_receive(:save)
        LocationLinker.unlink_location(location_1, "south")
      end

      it "does not throw an error" do
        location_1.stub(:south).and_return(nil)
        lambda { LocationLinker.unlink_location(location_1, "south") }.should_not raise_error
      end
    end

    context "east" do
      it "reset the eastern connection" do
        location_3 = double
        location_1.stub(:east).and_return(location_3)
        location_3.should_receive(:west=).with(nil)
        location_3.should_receive(:save)
        LocationLinker.unlink_location(location_1, "east")
      end

      it "does not throw an error" do
        location_1.stub(:east).and_return(nil)
        lambda { LocationLinker.unlink_location(location_1, "east") }.should_not raise_error
      end
    end

    context "west" do
      it "reset the western connection" do
        location_3 = double
        location_1.stub(:west).and_return(location_3)
        location_3.should_receive(:east=).with(nil)
        location_3.should_receive(:save)
        LocationLinker.unlink_location(location_1, "west")
      end

      it "does not throw an error" do
        location_1.stub(:west).and_return(nil)
        lambda { LocationLinker.unlink_location(location_1, "west") }.should_not raise_error
      end
    end
  end

  context ".link_locations" do
    context "north" do
      it "should call link_north_south with correct order" do
        LocationLinker.should_receive(:link_north_south).with(location_1, location_2)
        LocationLinker.link_locations(location_1, location_2, "north")
      end
    end

    context "south" do
      it "should call link_north_south with correct order" do
        LocationLinker.should_receive(:link_north_south).with(location_2, location_1)
        LocationLinker.link_locations(location_1, location_2, "south")
      end
    end

    context "west" do
      it "should call link_north_south with correct order" do
        LocationLinker.should_receive(:link_east_west).with(location_2, location_1)
        LocationLinker.link_locations(location_1, location_2, "west")
      end
    end

    context "east" do
      it "should call link_north_south with correct order" do
        LocationLinker.should_receive(:link_east_west).with(location_1, location_2)
        LocationLinker.link_locations(location_1, location_2, "east")
      end
    end
  end
end
