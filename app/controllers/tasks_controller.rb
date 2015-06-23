class TasksController < ApplicationController
 def index
  @tasks = Task.all

 end
  def show
    @task = Task.find_by!(id: params[:id])
    @comments = @task.comments
    @comment = Comment.new
    @users = @task.users
  end

  def new
   @task = Task.new
    @task.deadline = Date.today
  end

  def create
    Task.transaction do
    @task = Task.new(task_params)
    @task.save!

    redirect_to task_path(@task)
    end

  rescue ActiveRecord::RecordInvalid
    render :new
  end


 def edit
   @task = Task.find_by!(id: params[:id])
 end

  def update
    @task = Task.find_by!(id: params[:id])
    @task.attributes = task_params
    @task.save

    redirect_to :task

  end
 def destroy
  @task = Task.find_by!(id: params[:id])
  @task.destroy

  redirect_to :tasks

 end
  def task_params
    params.require(:task).permit(:task_name, :description, :deadline, :color)
  end

end


