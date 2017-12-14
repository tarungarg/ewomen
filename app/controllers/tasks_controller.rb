class TasksController < ApplicationController
  before_action :find_project
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @tasks = @project.tasks
    respond_with(@tasks)
  end

  def show
    respond_with(@task)
  end

  def new
    @task = @project.tasks.new
    respond_with(@task)
  end

  def edit
  end

  def create
    @task = @project.tasks.build(task_params)
    @task.save
    @task.users << params[:task][:user_ids].reject(&:blank?).map {|m| User.find(m)} if params[:task][:user_ids]
    respond_with(@task, location: project_path(@project))
  end

  def update
    @task.update(task_params)
    @task.users.clear
    @task.users << params[:task][:user_ids].reject(&:blank?).map {|m| User.find(m)} if params[:task][:user_ids]
    respond_with(@task, location: project_path(@project))
  end

  def destroy
    @task.destroy
    @task.users.clear
    respond_with(@task, location: project_path(@project))
  end

  private
    def set_task
      @task = @project.tasks.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:name, :description)
    end

    def find_project
      @project = Project.find(params[:project_id])
    end
end
