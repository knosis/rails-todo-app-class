class TasksController < ApplicationController

  def new
  end

  def index
    render json: Task.order(:created_at)
  end

  def create
    @task = Task.new(task_params)
    if !@task.save
      flash[:notice] = "failed to create task:\n#{@task.errors.full_messages.join("\n")}"
    end
    redirect_to root_path
  end

    def update
    @task = Task.find(params[:id])
    if !@task.update(params[:task])
      flash[:notice] = "failed to updates task\n#{@task.errors.full_messages.join("\n")}"
    end
    redirect_to root_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to root_path
  end

  def complete
    @task = Task.find(params[:id])
    @task.complete!
    render json: @task
  end

  def uncomplete
    @task = Task.find(params[:id])
    @task.uncomplete!
    render json: @task
  end

private
  def task_params
    params.require(:task).permit(:description, :completed)
  end
end
