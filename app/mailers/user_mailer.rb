class UserMailer < ApplicationMailer
  def weekly_message_info(email:, week_total_messages:, latest_messages:, date:)
    @week_total_messages = week_total_messages
    @latest_messages = latest_messages
    @date = date
    mail(to: email, subject: 'Weekly Message Info')
  end
end
