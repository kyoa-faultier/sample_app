require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "layout links" do
    # この組を画面ごとに作る
    get root_path
    # rootパスに行く
    assert_template 'static_pages/home'
    # 'static_pages/home'のテンプレートが表示されるはずだ
    assert_select "a[href=?]", root_path, count: 2
    # 上の状態で、リンク先が２つある。
    assert_select "a[href=?]", help_path
    # help_pathのリンクがある
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
  end
end
