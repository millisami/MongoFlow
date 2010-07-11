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
