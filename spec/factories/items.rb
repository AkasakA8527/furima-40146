FactoryBot.define do
  factory :item do

    item_name       do
      item_names = %w[ドライバー ハンドバッグ 剪定バサミ 汎用レンズ ジャンバー]
      item_names.sample
    end
    description     do
      descriptions = %w[便利です きれいな商品です ガーデニングに必携 デスク周りにお一つ ちょうどよい使い心地]
      descriptions.sample
    end
    category_id              { Faker::Number.within(range: 2..11) }
    condition_id             { Faker::Number.within(range: 2..7) }
    whopay_id                { Faker::Number.within(range: 2..3) }
    prefecture_id            { Faker::Number.within(range: 2..48) }
    shipday_id               { Faker::Number.within(range: 2..4) }
    price                    { Faker::Number.within(range: 300..9999999) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
