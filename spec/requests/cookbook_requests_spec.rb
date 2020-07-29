
RSpec.describe "Cookbook", type: :request do
    

    context "requests" do
        it "should be successful when signed in" do
            user = create(:user)
            recipe = create(:recipe, user: user)
            
            token = Knock::AuthToken.new(payload: {sub: user.id}).token
            
            get '/cookbook', headers: {'Authorization': "Bearer #{token}"}
            expect(response).to have_http_status(200)
        end

        it "should be return users recipes" do
            temp = []
            user = create(:user)
            recipe = create(:recipe, user: user)
            token = Knock::AuthToken.new(payload: {sub: user.id}).token
            
            get '/cookbook', headers: {'Authorization': "Bearer #{token}"}
            expect(response.body).to eql({list: [recipe: recipe, author: recipe.user, tags: recipe.tags], count: 1, jwt: token}.to_json)
        end

    end
  end