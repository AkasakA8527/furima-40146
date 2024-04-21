FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 4) + '1a' }
    password_confirmation { password }
    family_name_kanji     do
      kanji_names = %w[佐藤 鈴木 高橋 田中 伊藤 山本 中村 小林 吉田]
      kanji_names.sample
    end
    first_name_kanji do
      kanji_fnames = %w[一郎 忠 明夫 太郎 正男 旬 一平 幸治郎 優子]
      kanji_fnames.sample
    end
    family_name_kana      { Gimei.last.katakana }
    first_name_kana       { Gimei.first.katakana }
    birthday              { Faker::Date.birthday }
  end
end
