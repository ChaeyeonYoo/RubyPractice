require "test_helper"

class ProductMailerTest < ActionMailer::TestCase
  test "in_stock" do
    mail = ProductMailer.with(product: products(:tshirt), subscriber: subscribers(:david)).in_stock
    assert_equal "In stock", mail.subject
    assert_equal [ "david@example.org" ], mail.to
    assert_equal [ "chaiyeon7@gmail.com" ], mail.from
    assert_match "Good news!", mail.body.encoded
  end
end

# test 다른 언어 예시 찾아볼 것
# ... -> 각각 테스트 함수 하나를 뜻함
