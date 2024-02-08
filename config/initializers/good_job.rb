Rails.application.configure do
  config.good_job.enable_cron = true
  config.good_job.cron = {
    daily_at_midnight: {
      cron: '0 0 * * *',
      class: "UpdateJob"
    }
  }
end
