class Admin::JobsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :hide, :publish]
  before_filter :require_is_admin
  layout "admin"

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to admin_jobs_path, notice: "New a job success"
    else
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to admin_jobs_path, notice: "update success"
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to admin_jobs_path, alert: "Delete success"
  end

  def hide
    @job = Job.find(params[:id])
    @job.is_hidden = true
    @job.save!
    redirect_to admin_jobs_path, notice: "Hide job success"
  end

  def publish
    @job = Job.find(params[:id])
    @job.is_hidden = false
    @job.save!
    redirect_to admin_jobs_path, notice: "Publish job success"
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :wage_upper_bound, :wage_lower_bound, :contact_email, :is_hidden)
  end
end
