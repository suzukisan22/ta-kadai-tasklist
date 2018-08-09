class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :require_logged_in_user, only: [:edit, :create, :update]
  # should be call after `set_task`
  before_action :correct_user, only: [:edit, :update, :destory]

  def index
    @tasks = if logged_in?
      current_user.tasks
    end
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = current_user.tasks.build(task_params)

    if @task.save
      flash[:notice] = "タスクが正常に作られました。"
      redirect_to @task
    else
      flash.now[:danger] = "正常にタスクの作成ができませんでした"
      render :new
    end
  end

  def update
    if @task.update(task_params)
      flash[:notice] = "正常にタスク内容を更新しました。"
      redirect_to @task
    else
      flash.now[:danger] = "正常にタスクの更新ができませんでした"
      render :edit
    end
  end

  def destroy
    @task.destroy
    flash[:success] = '正常にタスクを削除しました。'
    redirect_to tasks_url
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:content, :status)
  end

  def correct_user
    unless current_user == @task.user
      redirect_to root_path
    end
  end
end
