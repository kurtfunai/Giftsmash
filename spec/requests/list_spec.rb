require 'spec_helper'

describe "list" do
  context "authentication" do
    context "with anonymous user" do
      it "allows guest to view lists" do
        list = FactoryGirl.create :list
        get list_path(list)
        response.status.should be(200)
      end
    end

    context "with logged in user" do
      it "allows user to create a new list" do

      end
    end
  end
end
