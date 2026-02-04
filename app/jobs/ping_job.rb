class PingJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Rails.logger.info("[PingJob] hello from sidekiq test")
  end
end
