class CommentsController < ApplicationController
  def index
    @comments = task.comments
  end
  def show
    @comment = task.comments.find_by!(id: params[:id])
  end

  def new
    @comment = task.comments.build
    @comment.times = Date.today
  end

  def create
    Task.transaction do
    @comment = task.comments.build
    @comment.attributes = comment_params
      @comment.save!

      redirect_to task_path(:id => params[:task_id])
    end

  rescue ActiveRecord::RecordInvalid
    render :new
  end


  def edit
    @comment = task.comments.find_by!(id: params[:id])
  end

  def update
    @comment = task.comments.find_by_id(params[:task_id])
    @comment.times = Date.today
    @comment.attributes = comment_params
    @comment.save

    redirect_to task_path(:id => params[:task_id])

  end
  def destroy
    @comment = task.comments.find_by!(id: params[:id])
    @comment.destroy

    redirect_to task_path(:id => params[:task_id])

  end
  def comment_params
    params.require(:comment).permit(:comment, :times)
  end
  def task
    @task ||= Task.find_by_id(params[:task_id])
  end

end
