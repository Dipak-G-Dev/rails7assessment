require 'rails_helper'
  RSpec.describe CommentsController, type: :controller do
    describe "index" do
      let!(:user) {User.create(first_name:"Test1", email:'Test134@mail1.com', password:'Test@12345', password_confirmation: 'Test@12345')}
      let!(:project) {Project.create(project_name:"New_project",user_id:user.id)}
      let!(:task) {Task.create(task:"Test_task",project_id: project.id, assigned_by_id:user.id, assigned_to_id:user.id)}
      before(:each) do
        sign_in user
      end
      it 'Get index' do
        get :index ,params: {task_id: task.id, id: task.id}
        expect(response).to have_http_status(:success) 
        should render_template('index')
      end
    end
    
    describe CommentsController, '#create' do
      let!(:user) {User.create(first_name:"Test4", email:'Test4@mail1.com', password:'Test@12345', password_confirmation: 'Test@12345')}
      let!(:project) {Project.create(project_name:"New_project",user_id:user.id)}
      let!(:task) {Task.create(task:"Test_task",project_id: project.id, assigned_by_id:user.id, assigned_to_id:user.id)}
      context "Anonymous user" do
        before :each do
          @attrs = {comment: "Test comment",user_id: user.id, task_id: task.id}
          post :create, :params => @attrs
        end
        it { should assigns(:task) }
        it { should respond_with(:redirect) }
      end
    end
  end