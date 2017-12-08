require 'rspec'
require_relative 'ez_ripper'

describe 'ez ripper' do
  it 'should work' do
    EzRipper.new('edit.ezr').run('fellowship.xml')
  end
end