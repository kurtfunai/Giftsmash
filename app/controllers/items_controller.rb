class ItemsController < ApplicationController
  before_filter :authenticate_user!

  # CanCan : Load as nested resource
  load_and_authorize_resource :list#, :instance_name => :list, :class => 'List'
  load_and_authorize_resource :item, :through => :list
  #skip_authorize_resource :only => :show

  # GET
  def index
    @items = @list.items
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end

  # GET
  def show
    
  end

  # POST
  def create
    @item = @list.items.create params[:item]
    respond_to do |format|
      format.html { redirect_to @list }
      format.js # create.js.erb
    end
  end

  # GET
  def edit
    respond_to do |format|
      format.html { redirect_to @list }
      format.js # edit.js.erb
    end
  end

  # PUT
  def update
    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @list, notice: 'List was successfully updated.' }
        format.js # update.js.erb
      else
        format.html { render action: "edit" }
        format.js
      end
    end
  end

  # DELETE
  def destroy
    @item.destroy

    respond_to do |format|
      format.html { redirect_to @list }
      format.json { head :no_content }
      format.js
    end
  end
end
