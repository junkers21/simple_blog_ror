# Preview all emails at http://localhost:3000/rails/mailers/notification_mailer
class NotificationMailerPreview < ActionMailer::Preview

  def post_published
    post = Post.new(title: "Test post")
    NotificationMailer.post_published(post)
  end
end
