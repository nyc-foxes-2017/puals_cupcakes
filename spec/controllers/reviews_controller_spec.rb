require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do

  include ApplicationHelper

  let(:user) {User.create!(email: "email@email.com", password:"ayyyyyyy", user_name:"wowowowow")}

  let(:movie) {get_movie_by_id("tt0112864")}
  let(:review_params) {{movie_id: movie[:imdbID], user_id: user[:id], title: "Good movie A+", body: "Rly good movie u should watch", rating: 10}}
  let(:review) {Review.create!(review_params)}

  before :each do
    sign_in user
  end
  describe 'GET #index' do
    it "responds with status code 200" do
      get :index, params: {:movie_id => movie[:imdbID]}
      expect(response).to have_http_status 200
    end

    it "renders the :index template" do
      get :index,params:  {:movie_id => movie[:imdbID]}

      expect(response).to render_template(:index)
    end
  end

  describe "GET #new" do
    it "responds with status code 200" do
      get :new, params: {:movie_id => movie[:imdbID]}
      expect(response).to have_http_status 200
    end

    it "assigns a new review to @review" do
      get :new,params:  {:movie_id => movie[:imdbID]}
      expect(assigns(:review)).to be_a_new Review
    end

    it "renders the :new template" do
      get :new ,params:  {:movie_id => movie[:imdbID]}
      expect(response).to render_template :new
    end
  end

   describe "POST #create" do
    context "when valid params are passed" do
      it "responds with status code 302" do
        post :create, params: {:movie_id=> movie[:imdbID], review: review_params }
        expect(response).to have_http_status 302
      end
      it "creates a new review in the database" do
        review_count = Review.all.length
        post :create, params: {:movie_id=> movie[:imdbID], review: review_params }
        expect(Review.all.length).to eq(review_count + 1)
      end

      it "assigns the newly created review as @review" do
        post :create, params: {:movie_id=> movie[:imdbID], review: review_params }
        review = Review.last
        expect(assigns(:review)).to eq review
      end


      it "redirects to the created review" do
        post :create, params: {:movie_id=> movie[:imdbID], review: review_params }
        review = Review.last
        expect(response).to redirect_to movie_path(id: review[:movie_id])
      end
    end
  end

  describe "DELETE #destroy" do
    it "responds with status code 302" do
      delete :destroy, params: {:movie_id=> movie[:imdbID], id: review[:id] }
      expect(response).to have_http_status 302
    end

    it "destroys the requested review" do
      post :create, params: {:movie_id=> movie[:imdbID], review: review_params }
      review_count1 = Review.all.length
      delete :destroy, params: {:movie_id=> movie[:imdbID], id: review[:id] }
      review_count2 = Review.all.length
      expect(review_count1).to eq(review_count2)
    end

    it "sets a notice that the review was destroyed" do
      delete :destroy, params: {:movie_id=> movie[:imdbID], id: review[:id] }
      expect(flash[:notice]).to match /review was successfully destroyed/
    end

    it "redirects to the reviews list" do
      delete :destroy, params: {:movie_id=> movie[:imdbID], id: review[:id] }
      expect(response).to redirect_to movie_reviews_path
    end
  end
end
