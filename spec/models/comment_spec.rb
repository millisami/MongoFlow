require 'spec_helper'

describe Comment do
  subject { Comment.new }

  it { should respond_to :content    }
  it { should respond_to :url        }
  it { should respond_to :byline     }
  it { should respond_to :user_id    }
  it { should respond_to :created_at }
  it { should respond_to :updated_at }
end
