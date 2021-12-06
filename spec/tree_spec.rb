require './lib/node'
require './lib/tree'
require 'pry'
RSpec.describe BinarySearchTree do
  before(:each) do
    @tree = BinarySearchTree.new()
    @tree.insert(40, 'Jack and Jill')
    @tree.insert(80, 'A Beautiful Mind')
  end
  describe 'Root' do
    it 'first node will be root' do
      expect(@tree.root.value).to eq(40)
    end
  end
  describe 'Insert' do
   it 'will return the depth of new node after insertion' do
     expect(@tree.insert(30, 'Space Jam')).to eq(1)
     expect(@tree.insert(90, 'Shawshank Redemption')).to eq(2)
   end
  end
  it 'will set the previous node as the parent node' do
    @tree.insert(30, 'Space Jam')
    expect(@tree.all_nodes.last.parent.value).to eq(40)
  end
  it 'will add the right and left node information to new nodes' do
    @tree.insert(50, 'Mission Impossible')
    @tree.insert(90, '12 angry men')
    expect(@tree.all_nodes[-3].right.name).to eq('12 angry men')
    # right of 'A beautiful mind is '12 angry men'
    expect(@tree.all_nodes[-3].left.value).to eq(50)
    # left of 'A beautiful mind is Mission Impossible'
  end
end
