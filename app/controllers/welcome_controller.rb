class WelcomeController < ApplicationController
  def index
    respond_to do |format|
      format.html # index.html.erc
      format.js # create.js.erb
    end
  end
end
