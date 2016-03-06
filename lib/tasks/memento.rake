namespace :memento do
  desc "Send daily reminder"
  task send_daly_reminder: :environment do
    SendDailyReminder.call
  end
end
