module TasksHelper
  def my_task(task)
    if task.assigned_to.id == current_user.id
       task.task
    end
  end

  def status(task)
    if task.status == "pending" && task.assigned_to.id == current_user.id
      return task.task
    end
  end
end
