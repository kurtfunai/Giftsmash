require 'spec_helper'

describe "list" do
  context "authentication" do
    context "with anonymous user" do
      it "secures lists index" do
        get lists_path
        response.status.should be(302)
        response.should redirect_to(new_user_session_path)
      end

      it "allows guest to view lists" do
        list = FactoryGirl.create :list
        get list_path(list)
        response.status.should be(200)
      end
    end

    context "with logged in user" do

    end
  end


  it "renders all lists" do
    get "/"
    response.status.should be(200)
    response.body.should match "Giftsmash"
  end
end
