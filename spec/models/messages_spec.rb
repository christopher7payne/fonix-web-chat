require "rails_helper"

RSpec.describe Message, :type => :model do
  context "add new message" do
    let!(:user) { create(:user) }
    let!(:room) { create(:room) }

    it "has none to begin with" do
      expect(Message.count).to eq 0
    end

    it "user, room and content are required" do
      record = Message.create(content: '')
      record.valid?
      expect(record.errors[:user]).to include("must exist")
      expect(record.errors[:room]).to include("must exist")
      expect(record.errors[:content]).to include("can't be blank")
    end

    it "with valid user, room and content" do
      Message.create(user_id: user.id, room_id: room.id, content: 'message')
      expect(Message.count).to eq 1
    end

  end
end
