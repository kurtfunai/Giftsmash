require 'spec_helper'

describe "welcome" do
  it "renders the homepage" do
    get "/"
    response.status.should be(200)
    response.body.should match "Giftsmash"
  end
end