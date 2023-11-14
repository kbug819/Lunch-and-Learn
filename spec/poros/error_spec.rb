
require 'rails_helper'

describe Error do
  it 'exists' do
    attributes = "Bad Credentials"
    error = Error.new(attributes)

    expect(error).to be_a Error
    expect(error.error_message).to eq(attributes)
  end
end