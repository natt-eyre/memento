class MementoMailer < ApplicationMailer
  def daily_reminder(user)
    @user = user
    @url  = 'http://memento-production.herokuapp.com/users/sign_in'
    mail(to: @user.email, subject: 'Memento: reminder')
  end
end
