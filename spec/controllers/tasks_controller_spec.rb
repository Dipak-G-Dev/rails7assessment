require 'rails_helper'
  RSpec.describe TasksController, type: :controller do
    describe "GET index" do
      let!(:user) {User.create(first_name:"Test1", email:'Test134@mail1.com', password:'Test@12345', password_confirmation: 'Test@12345')}
      let!(:project) {Project.create(project_name:"New_project",user_id:user.id)}
      before(:each) do
        sign_in user
      end
      it 'index' do
        get :index ,params: {project_id: project.id}
        expect(response).to have_http_status(:success) 
        should render_template('index')
      end
    end
    
    describe TasksController, '#create' do
      let!(:user) {User.create(first_name:"Test4", email:'Test4@mail1.com', password:'Test@12345', password_confirmation: 'Test@12345')}
      let!(:project) {Project.create(project_name:"New_project",user_id:user.id)}
      context "Anonymous user" do
        before :each do
          @attrs = {projec_name: "Test task",project_id: project.id}
          post :create, :params => @attrs
        end
        it { should assigns(:task) }
        it { should respond_with(:redirect) }
      end
    end

    describe TasksController, '#delete' do
      let!(:user) {User.create(first_name:"Test3", email:'Test3@mail1.com', password:'Test@12345', password_confirmation: 'Test@12345')}
      let!(:project) {Project.create(project_name:"New_project",user_id:user.id)}
      it "Delete Project" do
          @task_id = Task.create(task:"New_project",project_id:project.id).id.to_s
          expect do
            delete :destroy, :params => {project_id:project.id, id:@task_id}
          end.to change(Project, :count).by(0)
      end
    end

    describe TasksController, '#update' do 
      let!(:user) {User.create(first_name:"Test34", email:'Test34@mail1.com', password:'Test@12345', password_confirmation: 'Test@12345')}
      let!(:project) {Project.create(project_name:"New_project",user_id:user.id)}
      it "Update Project" do
        task = Task.create(task:"new Task")
        task_id = task.id.to_s
        patch :update,params: {project_id: project.id, task: "Update Task" ,id:task_id}
        expect(response).to be_redirect
      end
    end

  end