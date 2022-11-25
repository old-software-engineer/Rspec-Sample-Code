# frozen_string_literal: true

FactoryBot.define do
  factory :blog do
    title { 'TEST1' }
    body { 'test12' }
    imgurl { 'https://fujifilm-x.com/wp-content/uploads/2019/08/x-t3_sample-images02.jpg' }
  end

  factory :not_approved_blog, parent: :blog do
    title { 'TE' }
    body { 'test' }
    imgurl { 'https://fujifilm-x.com/wp-content/uploads/2019/08/x-t3_sample-images02.jpg' }
  end

  factory :wrong_url_blog, parent: :blog do
    title { 'TEST' }
    body { 'test body' }
    imgurl { 'https://fujifilm-x.com/wp-content' }
  end
end
