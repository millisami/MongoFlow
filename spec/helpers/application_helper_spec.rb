require 'spec_helper'

describe ApplicationHelper do
  class MockView < ActionView::Base; include ApplicationHelper; end
  
  describe '#form_errors' do
    class FakeItem
      include Mongoid::Document

      field :title
      validates_presence_of :title
      validates_length_of   :title, :minimum => 8

      def save; false; end
    end

    before do
      @template = MockView.new
      @item     = FakeItem.new
    end

    it 'should display the errors hash in a <ul>' do
      @item.valid?
      msg1 = @item.errors.full_messages[0]
      msg2 = @item.errors.full_messages[1]
      @template.form_errors(@item).should == "<ul class=\"errorExplanation\"><li>#{msg1}</li><li>#{msg2}</li></ul>"
    end

  end

end
