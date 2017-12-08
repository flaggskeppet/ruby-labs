require_relative 'xml_ripper'
require 'rspec'

# Börja på sid 343

describe 'XMLRipper' do
  xit 'should run' do #does not work with instance_eval
    result = ''
    ripper = XMLRipper.new
    ripper.after {|doc| result = 'foo'}
    ripper.run('fellowship.xml')
    expect(result).to eq 'foo'
  end

  it 'should support self yielding' do
    XMLRipper.new do
      after {|doc|}
      run('fellowship.xml')
    end
  end

  it 'should support run before and after tasks' do
    calls = 0
    XMLRipper.new do
      after {|doc| calls += 1;}
      before {|doc| calls += 1}
      run('fellowship.xml')
    end
    expect(calls).to equal 2
  end

  it 'should execute on path' do
    XMLRipper.new do
      on_path('/document/author') do |author|
        author.text = 'Jonas Mattsson'
      end

      after {|doc| puts doc}
      run('fellowship.xml')
    end
  end

  it 'should run script file' do
    ripper = XMLRipper.new
    ripper.initialize_from_file 'fix_author.ripper'
    ripper.run 'fellowship.xml'
  end

  it 'should support magic xpath methods' do
    ripper = XMLRipper.new
    ripper.on_document_author {|author| puts author.text}
    ripper.run 'fellowship.xml'
  end
end