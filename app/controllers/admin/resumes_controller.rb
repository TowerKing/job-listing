class Admin::ResumesController < ApplicationController
  layout "admin"

  def index
    @job = Job.find(params[:job_id])
    @resumes = @job.resumes
  end
end
