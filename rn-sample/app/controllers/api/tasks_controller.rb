class Api::TasksController < ApplicationController
  skip_forgery_protection

  before_action :authenticate_by_token

  def index
    @tasks = @user.tasks.where(created_at: Time.zone.today.all_day)
    render json: @tasks.map { |task| { id: task.id, name: task.name, check_flag:  task.check_flag}}
  end

  def create
    task = Task.create(task_params.merge(user: @user))
    render json: {id: task.id, name: task.name, check_flag: task.check_flag}, status: :created
  end

  def update
    task = Task.find(params[:id])
    (task.user == @user) ? task.update(task_params) : render(status: :unauthorized)
  end

  private

  def authenticate_by_token
    @user = User.find_by(api_token: params[:api_token])
    render status: :unauthorized, json: 'Invalid API token' if @user.blank?
  end

  def task_params
    params.require(:task).permit(:name, :check_flag)
  end
end
