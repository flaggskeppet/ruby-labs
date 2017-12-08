require 'rspec'
require_relative 'ez_ripper'
require 'treetop'
require 'ez_ripper_statement'

describe 'ez ripper' do
  it 'should work' do
    statement = "replace '/document/author' 'Russ Olsen'"
    parser = EzRipperStatementParser.new
    parse_tree = parser.parse( statement )
    puts parse_tree
  end
end