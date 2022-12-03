class TasksController < ApplicationController
  before_action :find_project_params, except: [:index]
  before_action :user_params, only: [:new, :edit]
  before_action :find_task, only: [:show, :edit, :update, :destroy]

  def index
    @task = Task.all
  end

  def new
    @task = @project.tasks.new
  end

  def create
    @task = @project.tasks.create(task_params)
    if @task.save
      redirect_to project_task_path(@project,@task)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to project_task_path(@project,@task)
    else
     render 'edit'
    end
  end

  def destroy
    if @task.destroy
      redirect_to root_path
    end
  end

  private

  def task_params
    params.require(:task).permit(:task, :assigned_by_id, :assigned_to_id, :project_id, :status)
  end

  def find_project_params
    @project = Project.find(params[:project_id])
  end

  def user_params
    @user = User.all
  end

  def find_task
    @task = @project.tasks.find(params[:id])
  end
end
