
require 'rails_helper'

describe Success do
  it 'exists' do
    attributes = "You've created a user"
    success = Success.new(attributes)

    expect(success).to be_a Success
    expect(success.message).to eq(attributes)
  end
end