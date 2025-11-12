# frozen_string_literal: true

namespace :active_job_kubernetes do
  task run_job: :environment do
    # We expect to have the classes all pre-loaded, so forcing that
    Rails.application.eager_load!
    # Set stdout to auto-flush so log messages come out while we run
    STDOUT.sync = true

    ActiveJob::Base.execute(JSON.parse(ENV['SERIALIZED_JOB']))
  end
end
