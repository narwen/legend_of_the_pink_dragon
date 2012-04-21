require 'spec_helper'

describe Admin::LocationsController do
  context "#new" do

    it "Should not allow normal users" do
      user = Fabricate(:user)
      session[:user_id] = user.id
      get :new
      subject.should respond_with(:redirect)
    end

    it "Should not allow guests" do
      get :new
      subject.should respond_with(:redirect)
    end

  end

  context "#create" do

    it "Should not allow normal users" do
      user = Fabricate(:user)
      session[:user_id] = user.id
      post :create, :location => Fabricate.attributes_for(:location)
      subject.send(:location).should_not be_persisted
      subject.should respond_with(:redirect)
    end

    it "Should not allow normal users" do
      post :create, :location => Fabricate.attributes_for(:location)
      subject.send(:location).should_not be_persisted
      subject.should respond_with(:redirect)
    end

  end

  context "#show" do

    it "Should not allow normal users" do
      user = Fabricate(:user)
      location = Fabricate(:location)
      session[:user_id] = user.id
      get :show, :id => location.id
      subject.should respond_with(:redirect)
    end

    it "Should not allow guests" do
      location = Fabricate(:location)
      get :show, :id => location.id
      subject.should respond_with(:redirect)
    end

  end
end
