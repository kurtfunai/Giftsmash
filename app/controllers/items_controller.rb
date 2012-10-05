class ItemsController < ApplicationController
  def create
    @list = List.find params[:list_id]
    @item = @list.items.create params[:item]

    respond_to do |format|
      format.html { redirect_to @list }
      format.js # create.js.erb
    end
  end
end
