class CommentsController < ApplicationController
  def index
    @task = Task.find(params[:id])
    @comment = @task.comments.all
  end
  def new
    @task = Task.find(params[:task_id])
    @comment =@task.comments.new
  end
  def create

    @task =Task.find(params[:task_id])
    if @task.assigned_to.id == current_user.id || @task.assigned_by.id == current_user.id
      @comment = @task.comments.create(comment_params)
      if @comment.save
        redirect_to task_comment_path(@task,@comment)
      else
        render 'new'
      end
    else
      redirect_to root_path
    end
  end

  def show
    @task = Task.find(params[:task_id])
    @comment = @task.comments.find(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :task_id, :user_id)
  end
end
