class TasksController < ApplicationController
  def index
    byebug # 1個目
    @tasks = Task.all
  end

  def new
    byebug # 2個目
    @tasks = Task.all
    @task = Task.new
  end

  def create
    byebug # 3個目
    task = Task.new(task_params)
    byebug # 4個目
    task.save!
    redirect_to tasks_url, notice: "タスク「#{task.name}」を登録しました。"
  end

  def show
    @task = Task.find(params[:id])
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])
    task.update!(task_params)
    redirect_to tasks_url, notice: "タスク「#{task.name}」を更新しました。"
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    redirect_to tasks_url, notice: "タスク「#{task.name}」を削除しました。"
  end
  
  private

  def task_params
    byebug # 5個目
    params.require(:task).permit(:name, :description)
  end
end