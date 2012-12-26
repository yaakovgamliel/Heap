Then 'I should see the heaplog\'s banner' do
  within('header') do
    text.should include(@heaplog.name)
    text.should include("by #{@user.name}")
  end
end
