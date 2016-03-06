namespace :memento do
  desc "Send daily reminder"
  task send_daily_reminder: :environment do
    SendDailyReminder.call
  end
end
