class DashboardController < ApplicationController
  def index
    @tasks = current_user.tasks
    @projects = Project.all
  end
end
