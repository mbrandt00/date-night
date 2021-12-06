

require './lib/node'

RSpec.describe Node do
  before(:each) do
    @node_1 = Node.new(40, 'Jack and Jill')
  end

  it 'exists' do
    expect(@node_1).to be_instance_of(Node)
  end

end
