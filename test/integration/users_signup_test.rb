require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    #　サインアップページにいきます（users/new）
    get signup_path
    # このブロックの中で実行された直前と直後で「ユーザーの数」は変わらないよ
    assert_no_difference 'User.count' do
      # フォームにパラメータを送ります
      post users_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    # 上のブロックの値は不正なので、元のサインアップページに戻りますよ
    assert_template 'users/new'
  end
  
  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:  "Example User",
                                         email: "user@example.com",
                                         password:              "password",
                                         password_confirmation: "password" } }
    end
    # リダイレクトする前になにかテストしたいときはここに書く。
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end
end