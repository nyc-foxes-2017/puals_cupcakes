require 'rails_helper'


RSpec.describe MoviesController, type: :controller do
  include ApplicationHelper
  let(:movie) {get_movie_by_id("tt0112864")}

  describe 'GET #index' do
    it "responds with status code 200" do
      get :index
      expect(response).to have_http_status 200
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end


  describe 'GET #show' do
    it "response with status code 200" do
      get :show, {id: movie[:imdbID]}
      expect(response).to have_http_status 200
    end

    it "assigns the correct song as @song" do
      get :show, { id: movie[:imdbID]}
      expect(assigns(:movie)).to eq(movie)
    end

    it "renders the :show template" do
      get :show, { id: movie[:imdbID]}
      expect(response).to render_template(:show)
    end
  end

  #Movies controller does not create movies, no need to test

end
