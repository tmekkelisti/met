require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      :username => "MyString",
      :password_digest => "MyString",
      :story_id => 1,
      :comment_id => 1
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input#user_username[name=?]", "user[username]"

      assert_select "input#user_password_digest[name=?]", "user[password_digest]"

      assert_select "input#user_story_id[name=?]", "user[story_id]"

      assert_select "input#user_comment_id[name=?]", "user[comment_id]"
    end
  end
end
