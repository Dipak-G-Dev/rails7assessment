require 'rails_helper'

RSpec.describe "Homepages", type: :request do
  describe "GET /home" do
    let!(:user) {User.create(first_name:"Test1", email:'Test134@mail1.com', password:'Test@12345', password_confirmation: 'Test@12345')}

    before(:each) do
      sign_in user
    end

    it "returns http success" do
      get "/"
      should render_template('home')
    end
  end

end
