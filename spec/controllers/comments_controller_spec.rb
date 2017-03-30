require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  include ApplicationHelper

  let(:user) {User.create!(email: "email@email.com", password:"ayyyyyyy", user_name:"wowowowow")}

  let(:movie) {get_movie_by_id("tt0112864")}
  let(:comment_params) {{movie_id: movie[:imdbID], user_id: user[:id],  body: "Rly good movie u should watch"}}
  let(:comment) {Comment.create!(comment_params)}

  before :each do
    sign_in user
  end


  describe "GET #new" do
    it "responds with status code 200" do
      get :new, params: {:movie_id => movie[:imdbID]}
      expect(response).to have_http_status 200
    end

    it "assigns a new comment to @comment" do
      get :new,params:  {:movie_id => movie[:imdbID]}
      expect(assigns(:comment)).to be_a_new Comment
    end

    it "renders the :new template" do
      get :new ,params:  {:movie_id => movie[:imdbID]}
      expect(response).to render_template :new
    end
  end

   describe "POST #create" do
    context "when valid params are passed" do
      it "responds with status code 302" do
        post :create, params: {:movie_id=> movie[:imdbID], comment: comment_params }
        expect(response).to have_http_status 302
      end
      it "creates a new comment in the database" do
        comment_count = Comment.all.length
        post :create, params: {:movie_id=> movie[:imdbID], comment: comment_params }
        expect(Comment.all.length).to eq(comment_count + 1)
      end

      it "assigns the newly created comment as @comment" do
        post :create, params: {:movie_id=> movie[:imdbID], comment: comment_params }
        comment = Comment.last
        expect(assigns(:comment)).to eq comment
      end


      it "redirects to the created comment" do
        post :create, params: {:movie_id=> movie[:imdbID], comment: comment_params }
        comment = Comment.last
        expect(response).to redirect_to movie_path(id: comment[:movie_id])
      end
    end
  end

  describe "DELETE #destroy" do
    it "responds with status code 302" do
      delete :destroy, params: {:movie_id=> movie[:imdbID], id: comment[:id] }
      expect(response).to have_http_status 302
    end

    it "destroys the requested comment" do
      post :create, params: {:movie_id=> movie[:imdbID], comment: comment_params }
      comment_count1 = Comment.all.length
      delete :destroy, params: {:movie_id=> movie[:imdbID], id: comment[:id] }
      comment_count2 = Comment.all.length
      expect(comment_count1).to eq(comment_count2)
    end

    it "sets a notice that the comment was destroyed" do
      delete :destroy, params: {:movie_id=> movie[:imdbID], id: comment[:id] }
      expect(flash[:notice]).to match /comment was successfully destroyed/
    end

    it "redirects to the movie page" do
      delete :destroy, params: {:movie_id=> movie[:imdbID], id: comment[:id] }
      expect(response).to redirect_to movie_path
    end
  end
end
