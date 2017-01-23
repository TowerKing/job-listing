module JobsHelper
  def format_created_at(job)
    job.created_at.strftime("%Y-%m-%d %H:%M:%S")
  end

  def render_job_description(job)
    simple_format(job.description)
  end
end
