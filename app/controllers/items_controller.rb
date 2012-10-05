class ItemsController < ApplicationController
  #before_filter :authenticate_user!

  # CanCan : Load as nested resource
  #load_resource
  #load_and_authorize_resource :list
  #load_and_authorize_resource :through => :list
  #skip_authorize_resource :only => :show
  #skip_authorize_resource :list, :only => :show

  def create
    @list = List.find params[:list_id] # Not needed with CanCan
    @item = @list.items.create params[:item]

    respond_to do |format|
      format.html { redirect_to @list }
      format.js # create.js.erb
    end
  end
end
