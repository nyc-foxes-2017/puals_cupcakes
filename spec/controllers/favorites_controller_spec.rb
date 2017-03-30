require 'rails_helper'

RSpec.describe FavoritesController, type: :controller do

  include ApplicationHelper

  let(:user) {User.create!(email: "email@email.com", password:"ayyyyyyy", user_name:"wowowowow")}

  let(:movie) {get_movie_by_id("tt0112864")}
  let(:favorite){Favorite.create(movie_id: movie[:imdbID], user_id:user[:id])}


  describe "POST #create" do
     it "assigns the newly created favorite as @favorite" do
       post :create, params: {:movie_id=> movie[:imdbID], favorite: favorite_params }
       favorite = Favorite.last
       expect(assigns(:favorite)).to eq favorite
     end


     it "redirects to the created favorite" do
       post :create, params: {:movie_id=> movie[:imdbID], favorite: favorite_params }
       favorite = Favorite.last
       expect(response).to redirect_to movie_path(id: favorite[:movie_id])
     end
   end
  end

  describe "DELETE #destroy" do
   it "responds with status code 302" do
     delete :destroy, params: {:movie_id=> movie[:imdbID], id: favorite[:id] }
     expect(response).to have_http_status 302
   end

   it "destroys the requested favorite" do
     post :create, params: {:movie_id=> movie[:imdbID], favorite: favorite_params }
     favorite_count1 = Favorite.all.length
     delete :destroy, params: {:movie_id=> movie[:imdbID], id: favorite[:id] }
     favorite_count2 = Favorite.all.length
     expect(favorite_count1).to eq(favorite_count2)
   end

   it "sets a notice that the favorite was destroyed" do
     delete :destroy, params: {:movie_id=> movie[:imdbID], id: favorite[:id] }
     expect(flash[:notice]).to match /favorite was successfully destroyed/
   end

   it "redirects to the favorites list" do
     delete :destroy, params: {:movie_id=> movie[:imdbID], id: favorite[:id] }
     expect(response).to redirect_to movie_favorites_path
   end
  end
end
