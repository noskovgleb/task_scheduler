class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @tasks = current_user.tasks.order(created_at: :desc).page(params[:page])
  end
end