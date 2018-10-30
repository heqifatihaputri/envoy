class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'
 
  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to Envoy App')
  end

  def invite_email(invite)
    @invite = invite
    mail(to: @invite.email_visitor, subject: "You've been invited to manage Envoy")
  end

  def visitor_email(visitor)
    @visitor = visitor
    mail(to: @visitor.user.email, subject: "Your visitor has arrived")
  end
end
