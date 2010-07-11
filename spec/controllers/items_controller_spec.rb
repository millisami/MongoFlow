require 'spec_helper'

describe ItemsController, "GET #index" do
  def do_get; get(:index); end
  before { Item.stub!(:reverse_chronological).and_return([]) }

  context "html" do
    it 'should respond successfully' do
      do_get
      response.should be_success
    end

    it 'should render index' do
      do_get
      response.should render_template 'index'
    end

    it 'should find some posts' do
      Item.should_receive :reverse_chronological
      do_get
    end

    it 'should set @items' do
      do_get
      assigns[:items].should_not be_nil
    end
  end

end
