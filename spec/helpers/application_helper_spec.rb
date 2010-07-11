require 'spec_helper'

describe ApplicationHelper do
  class MockView < ActionView::Base
    include ApplicationHelper
  end
  
  describe '#form_errors' do
    class FakeItem
      include Mongoid::Document

      field :title
      validates_presence_of :title
      validates_length_of   :title, :minimum => 8
    end

    before(:each) { @template = MockView.new }
    after(:all)   { Item.destroy_all         }

    it 'should display multiple errors hash in a list' do
      item = Item.create
      msg1 = item.errors.full_messages[0]
      msg2 = item.errors.full_messages[1]

      @template.form_errors(item).should == "<ul class=\"errorExplanation\"><li>#{msg1}</li><li>#{msg2}</li></ul>"
    end

    it 'should display one error in a list' do
      item = Item.create :title => "2short"
      msg = item.errors.full_messages[0]

      @template.form_errors(item).should == "<ul class=\"errorExplanation\"><li>#{msg}</li></ul>"
    end

  end

end
