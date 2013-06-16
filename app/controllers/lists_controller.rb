class ListsController < ApplicationController
  before_filter :authenticate_user!, except: [:show]

  load_and_authorize_resource

  def index
    @lists = current_user.lists
    # TODO (ps) the title are used for HTML only.
    # that's why you often use `content_for` blocks in your templates instead of setting it in the controller
    @title = "My Wishlists"

    respond_to do |format|
      format.html
      format.json { render json: @lists }
    end
  end

  def show
    # TODO (ps) put me in a before filter and redirect somewhere with flash message instead of raising an error
    raise "List not accessed using Friendly Id. Given '#{params[:id]}'" if !@list.found_using_friendly_id?(params[:id])
    @title = @list.title

    respond_to do |format|
      format.html
      format.json { render json: @list }
    end
  end

  def new
    @title = "New List"

    respond_to do |format|
      format.html
      format.json { render json: @list }
    end
  end

  def edit
    @title = "Edit List"
  end

  def create
    @list.user = current_user
    # TODO (ps) have a look at `respond_with` that does a lot of what you are doing here for free
    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: 'List was successfully created.' }
        format.json { render json: @list, status: :created, location: @list }
      else
        format.html { render action: "new" }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @list.update_attributes(params[:list])
        format.html { redirect_to @list, notice: 'List was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def delete
    @title = "Confirm Delete List"

    respond_to do |format|
      format.html
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy

    respond_to do |format|
      format.html { redirect_to lists_url, notice: 'List was deleted.' }
      format.json { head :no_content }
    end
  end
end
