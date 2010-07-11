require 'spec/spec_helper'

describe Item do
  before { @item = Item.new }

  it 'embeds many ratings' do 
    @item.ratings.should be_an Array
  end

  it 'embeds many tags' do 
    @item.tags.should be_an Array
  end
end

describe Item, '.reverse_chronological' do
  def item_factory(opts = {})
    item = Item.create!({ :title => 'mock title', :content => '.'*25 }.merge(opts))
  end

  before { Item.destroy_all }

  it 'should order items in reverse chronologic order' do
    item1 = item_factory
    item2 = item_factory(:created_at => item1.created_at + 1.second)
    Item.reverse_chronological.to_a.should == [item2, item1]
  end

  it 'should limit items to 25 by default' do
    (1..27).each { item_factory }
    Item.reverse_chronological.size.should == 25
  end

  it 'should allow passing in the limit' do
    (1..27).each { item_factory }
    Item.reverse_chronological(:limit => 10).size.should == 10
  end
end
