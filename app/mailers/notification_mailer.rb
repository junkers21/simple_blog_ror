class NotificationMailer < ApplicationMailer

  def post_published( post )
    @post = post
    post.update( is_sent: true )
    mail(to: post.email, subject: 'Article publié correctement')
  end
end
