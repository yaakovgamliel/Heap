Given 'a user exists' do
  @user = Fabricate(:user)
end

Given 'they have a heaplog' do
  @heaplog = @user.create_heaplog
end

Given /^it has (\d+) posts$/ do |count|
  @posts = (1..count.to_i).collect { Fabricate(:post, heaplog: @heaplog) }
end
