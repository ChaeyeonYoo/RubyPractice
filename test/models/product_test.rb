require "test_helper"

class ProductTest < ActiveSupport::TestCase
  include ActionMailer::TestHelper

  test "sends email notifications when back in stock" do
    product = products(:chocolate) # tshirt를 db에서 가져욤 -> fixture에서 레코드를 가져올 때 / fixture는 테스트할 때만

    # Set product out of stock
    emails = %w[abc@gmail.com asdf@gamil.com]
    emails.each do |email|
      product.subscribers.create(email: email)
    end

    product.update(inventory_count: 0)
    Subscriber.create!(product_id: product.id, email: "abc@abc.com")  # 1 구독자 기준 방법
    product.subscribers.create(email: "chaiyeon7@gmail.com") # 상품 기준 방법

    assert_emails 5 do
      product.update(inventory_count: 99)
    end
  end
end
