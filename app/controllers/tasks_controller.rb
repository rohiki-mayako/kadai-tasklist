class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @tasks = Task.find(params[:id])
  end

  def new
    @tasks = Task.new
  end

  def create
    @tasks = Task.new(task_params)

    if @tasks.save
      flash[:success] = 'Task が正常に登録されました'
      redirect_to @tasks
    else
      flash.now[:danger] = 'Task が投稿されませんでした'
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
  end

  def destroy
  @task = Task.find(params[:id])
  @task.destroy

    flash[:success] = 'Task は正常に削除されました'
    redirect_to tasks_url  
  end
  
  def task_params
    params.require(:task).permit(:content)
  end 
end 