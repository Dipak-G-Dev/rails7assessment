require 'rails_helper'

RSpec.describe "Projects", type: :request do
  describe "GET /index" do
    let!(:user) {User.create(first_name:"Test1", email:'Test134@mail1.com', password:'Test@12345', password_confirmation: 'Test@12345')}

    before(:each) do
      sign_in user
    end

    it "returns http success" do
      get "/projects"
      should render_template('index')
      # expect(response).to have_http_status(:success)
    end
  end

end
