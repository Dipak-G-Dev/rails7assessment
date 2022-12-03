class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_project, only: [:show, :edit, :update, :destroy]
  before_action :find_user, only: [:index, :new, :create]

  def index
    @project = @user.projects.all
  end

  def new
    @project = @user.projects.new
  end

  def create
    @project = @user.projects.create(project_params)
    if @project.save
      redirect_to project_path(@project)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to project_path(@project)
    else
      render 'edit'
    end
  end

  def destroy
    if @project.destroy
      redirect_to root_path
    end
  end

  private

  def project_params
    params.require(:project).permit(:project_name)
  end

  def  find_project
    @project= Project.find(params[:id])
  end

  def find_user
    @user =current_user
  end
end
