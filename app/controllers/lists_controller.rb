class ListsController < ApplicationController
  before_filter :authenticate_user!, except: [:show]

  load_and_authorize_resource
  respond_to :html

  def index
    @lists = current_user.lists
    # TODO (ps) the title are used for HTML only.
    # that's why you often use `content_for` blocks in your templates instead of setting it in the controller
    @title = "My Wishlists"
  end

  def show
    if !@list.found_using_friendly_id?(params[:id])
      redirect_to(root_path, alert: "No list found with id: '#{params[:id]}'")
    end
    @title = @list.title
  end

  def new
    @title = "New List"
  end

  def edit
    @title = "Edit List"
  end

  def create
    @list.user = current_user

    if @list.save
      redirect_to(@list, notice: 'List was successfully created.')
    else
      render :new
    end
  end

  def update
    if @list.update_attributes(params[:list])
      redirect_to @list, notice: 'List was successfully updated.'
    else
      render :edit
    end
  end

  def delete
    @title = "Confirm Delete List"
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy

    redirect_to lists_url, notice: 'List was deleted.'
  end
end
