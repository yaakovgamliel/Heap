Fabricator(:heaplog) do
  user
  description { Faker::Lorem.sentences(6).join ' ' }
end
