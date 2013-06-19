require 'spec_helper'

describe ItemsController do
  context "authentication" do
    context "with user" do
      login_user

      before(:each) do
        @list = create(:list, user: subject.current_user)
        @item = create(:item, list: @list)
        @new_item = attributes_for(:item)
      end

      context "GET :new" do
        it "gets new item" do
          xhr :get, :new, list_id: @list
          response.status.should be(200)
        end
      end
      
      context "POST :create" do
        it "gets creates new item" do
          expect { xhr :post, :create, list_id: @list, item: @new_item }.to change(Item, :count).by(1)
          assigns(:item).list.should eql(@list)
        end
      end

      context "GET :edit" do
        it "gets edit item" do
          xhr :get, :edit, list_id: @list, id: @item
          response.status.should be(200)
        end
      end

      context "PUT :update" do
        it "gets updates item" do
          xhr :put, :update, list_id: @list, id: @item
          response.status.should be(200)
        end
      end

      context "DELETE :destroy" do
        it "deletes an item" do
          xhr :delete, :destroy, list_id: @list, id: @item
          response.status.should be(200)
        end
      end
    end

    context "with anonymous user" do
      before(:each) do
        @list = create(:list)
        @item = create(:item, list: @list)
        @new_item = attributes_for(:item)
      end

      it "secures GET :new" do
        xhr :get, :new, list_id: @list
        response.status.should be(401)
      end

      it "secures POST :create" do
        xhr :post, :create, list_id: @list, item: @new_item
        response.status.should be(401)
      end

      it "secures GET :edit" do
        xhr :get, :edit, list_id: @list, id: @item
        response.status.should be(401)
      end

      it "secures PUT :update" do
        xhr :put, :update, list_id: @list, id: @item
        response.status.should be(401)
      end

      it "secures DELETE :destroy" do
        xhr :delete, :destroy, list_id: @list, id: @item
        response.status.should be(401)
      end
    end
  end
end
