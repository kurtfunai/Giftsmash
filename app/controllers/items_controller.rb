class ItemsController < ApplicationController
  before_filter :authenticate_user!

  load_and_authorize_resource :list
  load_and_authorize_resource :item, :through => :list

  def index
    @items = @list.items
    respond_to do |format|
      format.html { redirect_to @list }
      format.json { render json: @items }
    end
  end

  def show
    respond_to do |format|
      format.html { redirect_to @list }
      format.js
    end
  end

  def new
    respond_to do |format|
      format.html { redirect_to @list }
      format.js
    end
  end

  def create
    @item = @list.items.create params[:item]
    respond_to do |format|
      format.html { redirect_to @list }
      format.js
    end
  end

  def edit
    respond_to do |format|
      format.html { redirect_to @list }
      format.js
    end
  end

  def update
    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @list, notice: 'List was successfully updated.' }
        format.js
      else
        format.html { render action: "edit" }
        format.js
      end
    end
  end

  def destroy
    @item.destroy

    respond_to do |format|
      format.html { redirect_to @list }
      format.json { head :no_content }
      format.js
    end
  end
end
