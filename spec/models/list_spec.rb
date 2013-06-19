require 'spec_helper'

describe "list" do
  context "validation" do
    before(:each) do
      @list = create(:list)
    end
    it "creates valid instances" do
      @list.should be_valid
    end

    it "was found using friendly id" do
      @list.found_using_friendly_id?(@list.slug).should eq(true)
    end

    it "was not found using friendly id" do
      @list.found_using_friendly_id?(@list.id).should eq(false)
    end

    it "generates friendly id for new records" do
      list = build :list
      list.should_generate_new_friendly_id?.should eq(true)
    end

    it "creates a slug for new list" do
      list = build :list
      list.date_and_user_id
      list.slug.should_not be_nil
    end
  end
end
