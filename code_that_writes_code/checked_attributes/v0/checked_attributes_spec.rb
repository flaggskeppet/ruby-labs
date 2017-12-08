require_relative 'checked_attributes'
require 'rspec'

describe 'checked_attributes' do
  it 'should set a property' do
    bob = Person.new
    bob.age = 20
  end

  it 'should not allow nil values' do
    bob = Person.new
    expect {bob.age = nil}.to raise_error 'Invalid attribute'
  end
end