Fabricator(:user) do
  name { Faker::Name.name }
  nickname { Faker::Name.name.to_url }
  location { "#{Faker::Address.city}, #{Faker::Address.state}." }
  image do
    %w[
      http://safedriving.files.wordpress.com/2010/02/crash-test2.jpg
      http://junkcarnation.com/blog/wp-content/uploads/2010/05/crashDummy.jpg
      http://luckyinlovenz.files.wordpress.com/2012/07/crash-test-dummies.jpg
      http://www.photo-dictionary.com/photofiles/list/4615/6106crash_test_dummy.jpg
      http://newsimg.bbc.co.uk/media/images/42802000/jpg/_42802979_dummies416.jpg
      http://1.bp.blogspot.com/-Lq6him7umtE/T4yh6aOCwMI/AAAAAAAAAv0/sHGdgbvevYU/s400/Crash+Test+Dummies+ctdmmies2.jpg
      http://lowres-picturecabinet.com.s3-eu-west-1.amazonaws.com/43/main/18/96913.jpg
      http://www.artsjournal.com/dewey21c/crash_test_dummy.jpg
    ].sample
  end
  description { Faker::Lorem.sentences(2).join(' ') }
  extra_url { "http://#{Faker::Internet.domain_name}/" }
end

Fabricator(:heap_user, from: :user) do
  name {'Heap Team'}
  nickname {'heap'}
  location {'The Internets'}
  image {'/assets/leaf_on_green.png'}
  description {'The hard working team of monkeys behind [logheap.io](http://logheap.io/).'}
  extra_url {'http://logheap.io'}
end
