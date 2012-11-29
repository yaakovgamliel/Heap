# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
heap_user = User.create name: 'Heap Team', nickname: 'heap', location: 'The Cloud', description: 'The hard working team of monkeys behind [logheap.io](http://logheap.io/).', extra_url: 'http://logheap.io'

heap_log = heap_user.create_heaplog name: 'Heap', description: 'Yet another blog. Simple.', short_name: 'heap', banner_url: '/assets/logs1.jpg'


