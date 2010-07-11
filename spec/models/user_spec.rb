require 'spec/spec_helper'

describe User do
  it 'requires a login' do
    user = User.new

    user.should_not be_valid
    user.errors.on(:login).should_not be_blank
  end
  it 'requires an email'
  it 'requires a password'
end
