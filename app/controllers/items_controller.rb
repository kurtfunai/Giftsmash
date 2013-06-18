class ItemsController < ApplicationController
  before_filter :authenticate_user!

  load_and_authorize_resource :list
  load_and_authorize_resource :item, :through => :list

  respond_to :js

  def new
  end

  def create
    @item = @list.items.create params[:item]
  end

  def edit
  end

  def update
    if @item.update_attributes(params[:item])
      render :update
    else
      render :new
    end
  end

  def destroy
    @item.destroy
  end
end
