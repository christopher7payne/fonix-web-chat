class UserMailer < ApplicationMailer
  def weekly_message_info(email:, week_total_messages:, received_since_user_last_messages:, date:)

    @week_total_messages = week_total_messages
    @received_since_user_last_messages = received_since_user_last_messages
    @date = date
    mail(to: email, subject: 'Weekly Message Info')
  end
end
