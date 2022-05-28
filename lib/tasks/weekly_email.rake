require 'rubygems'

namespace :weekly_email do
  desc "Send email to each user with information regarding messages"
  task send: :environment do
    week_total_messages = Message.where("created_at >= ?", 1.week.ago).count
    received_since_user_last_messages = 0

    User.all.each do |user|
      last_message_from_user = user.messages.last
      received_since_user_last_messages = Message.where("created_at > ?", last_message_from_user.created_at).count

      puts "User: #{user.email} - #{week_total_messages} messages have been exchanged in the last week - #{received_since_user_last_messages} since your last message on the #{last_message_from_user.created_at.strftime("#{last_message_from_user.created_at.day.ordinalize} of %B")}"
    end

    puts "Done"
  end

  task populate: :environment do
    desc "TEST USE ONLY - Populate the models with random data"

    room = Room.create_with(name: 'Test', enabled: true).find_or_create_by(name: 'Test')
    msg_count = 0
    user_count = 0

    rand(5..10).times do
      email = Faker::Internet.email
      user = User.create_with(email: email, password: 'password1').find_or_create_by(email: email)

      user_count += 1

      rand(5..10).times do
        created_at = Faker::Time.between(from:30.days.ago, to: DateTime.now)
        Message.create(user_id: user.id, room_id: room.id, content: 'test', created_at: created_at)
        msg_count += 1
      end
    end

    puts "Created #{user_count} Users, and #{msg_count} Messages"
  end

  task delete_all: :environment do
    desc "TEST USE ONLY - Delete all users, rooms and messages"
    Message.delete_all
    User.delete_all
    Room.delete_all

    puts "Done"
  end
end
