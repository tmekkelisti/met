require 'rails_helper'

RSpec.describe User, type: :model do
  it "has the username set correctly" do
    user = User.new username:"nimi"

    expect(user.username).to eq("nimi")
  end

  it "is not saved with too short or long username" do
    user = User.create username:"ni", password:"A1ii", password_confirmation:"A1ii"
    user1 = User.create username:"12345678901234567890", password:"A1ii", password_confirmation:"A1ii"

    expect(user).not_to be_valid
    expect(user1).not_to be_valid
    expect(User.count).to eq(0)
  end

  it "is not saved without a password" do
    user = User.create username:"nimi"

    expect(user).not_to be_valid
    expect(User.count).to eq(0)
  end

  it "is not saved with too short password" do
    user = User.create username:"nimi", password:"A1", password_confirmation:"A1"

    expect(user).not_to be_valid
    expect(User.count).to eq(0)
  end

end
