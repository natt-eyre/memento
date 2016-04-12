class MementoMailer < ApplicationMailer
  def daily_reminder(user)
    @user = user
    @login  = 'http://memento-production.herokuapp.com/users/sign_in'
    @unsubscribe = unsubscribe_url(@user.access_token)
    mail(to: @user.email, subject: 'Memento: reminder')
  end
end
