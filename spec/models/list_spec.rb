require 'spec_helper'

describe "list" do
  context "validation" do
    it "creates valid instances" do
      list = FactoryGirl.build :list
      list.should be_valid
    end
  end
end