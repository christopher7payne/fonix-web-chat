require "rails_helper"

RSpec.describe Room, :type => :model do
  context "add new room" do
    it "has none to begin with" do
      expect(Room.count).to eq 0
    end

    it "add new room increments user count" do
      Room.create(name: 'Room name')
      expect(Room.count).to eq 1
    end

    it "with no name provides error" do
      record = Room.create(name: '')
      record.valid?
      expect(record.errors[:name]).to include("can't be blank")
    end

    it "cant add 2 rooms with same name" do
      Room.create(name: 'Room 1')
      expect(Room.count).to eq 1
      record = Room.create(name: 'Room 1')
      record.valid?
      expect(record.errors[:name]).to include("has already been taken")
    end

  end
end
