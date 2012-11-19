Fabricator(:post) do
  title { Faker::Lorem.sentences(1).first }
  body { Faker::Lorem.sentences(6).join ' ' }
  posted_at { 1.day.from_now }
  heaplog
end
