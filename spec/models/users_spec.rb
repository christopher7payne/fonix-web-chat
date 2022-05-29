require "rails_helper"

RSpec.describe User, :type => :model do
  context "add new user" do
    it "has none to begin with" do
      expect(User.count).to eq 0
    end

    it "add new user increments user count" do
      User.create(email: Faker::Internet.email, password: 'password1')
      expect(User.count).to eq 1
    end

    it "cant add user without email and password" do
      record = User.create(email: '', password: '')
      record.valid?
      expect(record.errors[:email]).to include("can't be blank")
      expect(record.errors[:password]).to include("can't be blank")
    end

    it "cant add 2 users with same email" do
      email = Faker::Internet.email
      User.create(email:email, password: 'password1')
      expect(User.count).to eq 1
      duplicate_user = User.create(email:email, password: 'password1')
      duplicate_user.valid?
      expect(duplicate_user.errors[:email]).to include("has already been taken")
    end
  end
end
