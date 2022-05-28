# fonix-web-chat

- Technical Interview Challenge

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

Rake task: rake weekly_email:send
