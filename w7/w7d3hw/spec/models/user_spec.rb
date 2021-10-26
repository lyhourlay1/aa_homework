require 'rails_helper'

RSpec.describe User, type: :mode do 
  subject(:user) {FactoryBot.build:user} 
  describe 'validations' do 
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:password_digest)}
    it {should validate_length_of(:password).is_at_least(6)}
  end

  describe "#reset_session_token" do 
   it "sets new session token on the user" do
    user.valid?
    old_session_token = user.session_token
    user.reset_session_token!
    expect(user.session_token).to_not  eq(old_session_token)
   end
  end

  describe "is_password?" do
    it "check if the password match" do 
      expect(user.is_password?("good password").to be true)
    end
    it "check if the password does match" do 
      expect(user.is_password?("bad password").to be false)
    end
  end

  describe "::find_by_credential" do
    before {user.save!}
    it "find the user by password" do
      expect(User.find_by_credentials("lylay@ucsd.edu", "good password").to eq (user))
    end
    it "cannot find the user " do
      expect(User.find_by_credentials("lyhourlay1@gmail.com", "bad password").to eq(nil))
    end
  end
  

# describe User do
#   subject(:user) do
#     FactoryBot.build(:user,
#       email: "jonathan@fakesite.com",
#       password: "good_password")
#   end

#   it { should validate_presence_of(:email) }
#   it { should validate_presence_of(:password_digest) }
#   it { should validate_length_of(:password).is_at_least(6) }

#   it "creates a password digest when a password is given" do
#     expect(user.password_digest).to_not be_nil
#   end

#   it "creates a session token before validation" do
#     user.valid?
#     expect(user.session_token).to_not be_nil
#   end

#   describe "#reset_session_token!" do
#     it "sets a new session token on the user" do
#       user.valid?
#       old_session_token = user.session_token
#       user.reset_session_token!

#       # Miniscule chance this will fail.
#       expect(user.session_token).to_not eq(old_session_token)
#     end

#     it "returns the new session token" do
#       expect(user.reset_session_token!).to eq(user.session_token)
#     end
#   end

#   describe "#is_password?" do
#     it "verifies a password is correct" do
#       expect(user.is_password?("good_password")).to be true
#     end

#     it "verifies a password is not correct" do
#       expect(user.is_password?("bad_password")).to be false
#     end
#   end

#   describe ".find_by_credentials" do
#     before { user.save! }

#     it "returns user given good credentials" do
#       expect(User.find_by_credentials("jonathan@fakesite.com", "good_password")).to eq(user)
#     end

#     it "returns nil given bad credentials" do
#       expect(User.find_by_credentials("jonathan@fakesite.com", "bad_password")).to eq(nil)
#     end
#   end
end
