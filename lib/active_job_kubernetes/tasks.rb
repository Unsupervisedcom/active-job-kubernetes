# frozen_string_literal: true

namespace :active_job_kubernetes do
  task run_job: :environment do
    Rails.application.eager_load!
    ActiveJob::Base.execute(JSON.parse(ENV['SERIALIZED_JOB']))
  end
end
