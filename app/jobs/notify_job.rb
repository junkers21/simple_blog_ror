class NotifyJob < ApplicationJob
  queue_as :default

  def perform(*args)
    Post.where( is_sent: false ).each do |post|
      NotificationMailer.post_published(post).deliver_later
    end
  end
end
