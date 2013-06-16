require 'spec_helper'

describe ListsController do
  context "authentication" do
    context "with user" do
      login_user
      before (:each) do
        @list = create(:list, user: subject.current_user)
        @new_list = attributes_for(:list)
        @other_users_list = create(:list)
      end

      context "GET :index" do
        it "gets user list index page" do
          get :index
          response.status.should be(200)
          expect(assigns(:lists)).to eq([@list])
        end
      end
      context "GET :show" do
        it "shows list" do
          get :show, id: @list
          response.status.should be(200)
          expect(assigns(:list)).to eq(@list)
        end
        it "shows another users list" do
          get :show, id: @other_users_list
          response.status.should be(200)
          expect(assigns(:list)).to eq(@other_users_list)
        end
      end
      context "GET :new" do
        it "gets new list page" do
          get :new
          response.status.should be(200)
        end
      end
      context "POST :create" do
        it "creates a new list" do
          expect { post :create, :list => @new_list }.to change(List, :count).by(1)
          response.status.should be(302)
          response.should redirect_to(assigns(:list))
        end
      end
      context "GET :edit" do
        it "gets edit list page" do
          get :new, :id => @list
          response.status.should be(200)
        end
        it "cannot view edit for another users list" do
          lambda { put :update, :id => @other_users_list }.should raise_error(CanCan::AccessDenied)
        end
      end
      context "PUT :update" do
        it "updates the list" do
          put :update, :id => @list, :list => @new_list
          response.status.should be(302)
          response.should redirect_to(assigns(:list))
        end
        it "cannot update another users list" do
          lambda { put :update, :id => @other_users_list, :list => @new_list }.should raise_error(CanCan::AccessDenied)
        end
      end
      context "GET :delete" do
        it "gets delete list page" do
          get :delete, :id => @list
          response.status.should be(200)
        end
        it "cannot view delete page for another users list" do
          lambda { get :delete, :id => @other_users_list }.should raise_error(CanCan::AccessDenied)
        end
      end
      context "DELETE :destroy" do
        it "deletes the list" do
          delete :destroy, :id => @list
          response.status.should be(302)
          response.should redirect_to(lists_path)
        end
        it "cannot delete another users list" do
          lambda { delete :destroy, :id => @other_users_list }.should raise_error(CanCan::AccessDenied)
        end
      end
    end

    context "with anonymous user" do
      it "allows guest to view lists" do
        list = create :list
        get :show, :id => list.slug
        response.status.should be(200)
      end

      it "secures list new" do
        get :new
        response.status.should be(302)
        response.should redirect_to(new_user_session_path)
      end

      it "secures list create" do
        post :create
        response.status.should be(302)
        response.should redirect_to(new_user_session_path)
      end

      it "secures list edit" do
        list = create :list
        get :edit, :id => list
        response.status.should be(302)
        response.should redirect_to(new_user_session_path)
      end

      it "secures list update" do
        list = create :list
        put :update, :id => list, :list => list
        response.status.should be(302)
        response.should redirect_to(new_user_session_path)
      end

      it "secures list delete" do
        list = create :list
        get :delete, :id => list
        response.status.should be(302)
        response.should redirect_to(new_user_session_path)
      end

      it "secures list destroy" do
        list = create :list
        delete :destroy, :id => list
        response.status.should be(302)
        response.should redirect_to(new_user_session_path)
      end
    end
  end
end
