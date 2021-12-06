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
  it 'will set the previous node as the parent node' do
    @tree.insert(30, 'Space Jam')
    expect(@tree.all_nodes.last.parent.value).to eq(40)
  end
  it 'will add the right and left node information to new nodes' do
    @tree.insert(50, 'Mission Impossible')
    @tree.insert(90, '12 angry men')
    expect(@tree.all_nodes[-3].right.movie).to eq('12 angry men')
    # right of 'A beautiful mind is '12 angry men'
    expect(@tree.all_nodes[-3].left.value).to eq(50)
    # left of 'A beautiful mind is Mission Impossible'
    end
  end

  describe 'Include' do
    it 'will return true if value is included in tree' do
      expect(@tree.include?(40)).to be(true)
    end
    it 'will return false if value is not included in tree' do
      expect(@tree.include?(10)).to be(false)
    end
  end

  describe 'Max/Min' do
    it 'will return the max value in the tree' do
      expect(@tree.max).to eq({'A Beautiful Mind' => 80})
    end
    it 'will return the min value in the tree' do
      @tree.insert(15, 'Jumanji')
      @tree.insert(20, 'Jason Bourne')
      @tree.insert(1, 'Angry Birds the movie')
      expect(@tree.min).to eq({'Angry Birds the movie' => 1})
    end
  end
end
