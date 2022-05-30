# fonix-web-chat

Technical Interview Challenge

-- Introduction

This document outlines the technical challenge to be completed as part of the
job application for Fonix.

-- Challenge requirements
The test must be done using Rails.
Git must be used as version control (if possible push it to github).
Messages should be sent through web sockets (Action Cable).

-- Description
We want to create a Web chat.
We'll start with a prototype which will have only one channel/room and all the
users subscribed will have access to the only available channel.

Users must be able to create an account providing a valid email address.
Once logged in users must be able to send and receive messages.

The system should send to all the users a weekly email specifying how many
messages were sent and received in the last week and the total number of
messages received since the user has sent his last message.

I.e.:
600 messages have been exchanged in the last week.
750 since your last message on the 1st of February.

---

Homepage: http://127.0.0.1:3000

For the user authencication side I've used Devise.

Ive built a rake taks to generate the taks to send each user an email with the imformation of how many messages have been sent in the past week and how many messages have been sent since their last message sent. I have added the letter_opener_web gem to capture local emails and has a nice GUI with it to check messages. 

Rake task: rake weekly_email:send

I did also create 2 other rake task to help with development (i would delete these in a live production env!):
- rake weekly_email:populate
- rake weekly_email:delete_all

-- Ideas and improvments
Fix the issue with the message field keeping the message in it after being sent
See if a Gem such as kaminari could partition the messages when they get to a long list
More Rspec test more specificly System test to test the user interface
