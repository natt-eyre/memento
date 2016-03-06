class SendDailyReminder
  def self.call
    User.find_each do |user|
      MementoMailer.daily_reminder(user).deliver_now
    end
  end
end
