Given 'a user exists' do
  @user = Fabricate(:user)
end

Given 'they have a heaplog' do
  @heaplog = @user.create_heaplog
end
