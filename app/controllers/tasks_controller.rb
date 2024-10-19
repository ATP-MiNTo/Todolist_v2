class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]
  before_action :default_category, only: %i[ new create ]

  def index
    @tasks = Task.all
  end

  def incomplete
    @task = Task.where(status: :'ongoing')
  end

  def complet
    @task = Task.where(status: :'complete')
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
  
    if @task.catego_id.present?
      @task.catego = Catego.find(@task.catego_id)
    end
  
    Rails.logger.info("Task params: #{task_params.inspect}")
  
    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: "Task was successfully created." }
        format.json { render :show, status: :created, location: @task }
      else
        Rails.logger.error("Task errors: #{@task.errors.full_messages}")
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end
  

  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end
  

  def toggle_status
    @task = Task.find(params[:id])
    @task.toggle_status
  
    notice_message = @task.complete? ? 'Task marked as Complete.' : 'Task marked as On going.'
    redirect_to tasks_path, notice: notice_message
  end
  
  def destroy
    @task.destroy!

    respond_to do |format|
      format.html { redirect_to tasks_path, status: :see_other, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def default_category
      Catego.find_or_create_by(name: 'All')
    end

    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(:name, :status, :catego_id)
    end
end
