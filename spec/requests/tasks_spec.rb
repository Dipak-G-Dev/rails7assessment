require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  describe "GET /index" do
    let!(:user) {User.create(first_name:"Test1", email:'Test134@mail1.com', password:'Test@12345', password_confirmation: 'Test@12345')}
    let!(:project) {Project.create(project_name:"New_project",user_id:user.id)}
    before(:each) do
      sign_in user
    end

    it "returns http success" do
      get "/projects/:project_id/tasks" ,:params => {project_id:project.id}
      should render_template('index')
    end
  end
end
