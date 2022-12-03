require 'rails_helper'
  RSpec.describe ProjectsController, type: :controller do
    describe "GET index" do
      let!(:user) {User.create(first_name:"Test1", email:'Test134@mail1.com', password:'Test@12345', password_confirmation: 'Test@12345')}
      before(:each) do
        sign_in user
      end
      subject { get :index }
      it { expect(response).to have_http_status(:success) }
      it { should render_template('index') }
    end
    
    describe ProjectsController, '#create' do
      let!(:user) {User.create(first_name:"Test4", email:'Test4@mail1.com', password:'Test@12345', password_confirmation: 'Test@12345')}

      context "Anonymous user" do
        before :each do
          @attrs = {projec_name: "Test Project"}
          post :create, :params => @attrs
        end
        it { should assigns(:project) }
        it { should respond_with(:redirect) }
      end
    end

    describe ProjectsController, '#delete' do
      let!(:user) {User.create(first_name:"Test3", email:'Test3@mail1.com', password:'Test@12345', password_confirmation: 'Test@12345')}

      it "Delete Project" do
          @project_id = Project.create(project_name:"New_project",user_id:user.id).id.to_s
          count = Project.count
          expect do
            delete :destroy, params:{id:@project_id}
          end.to change(Project, :count).by(0)
      end
    end

    describe ProjectsController, '#update' do 
      let!(:user) {User.create(first_name:"Test34", email:'Test34@mail1.com', password:'Test@12345', password_confirmation: 'Test@12345')}

      it "Update Project" do
        project = Project.create(project_name:"New_project",user_id:user.id)
        project_id = project.id.to_s
        @attrs = {projec_name: "Update Project" ,id:project_id}
        patch :update, :params => @attrs
        expect(response).to be_redirect
      end
    end

  end