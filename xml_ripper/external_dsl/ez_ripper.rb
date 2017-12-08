require_relative 'xml_ripper'

# This is a wrapper around XMLRipper serving as an external dsl-parser, translating and forwarding calls to XMLRipper
class EzRipper
  def initialize(program_path)
    @ripper = XMLRipper.new
    parse_program program_path
  end

  def parse_program(program_path)
    File.open(program_path) do |f|
      until f.eof?
        parse_statement f.readline
      end
    end
  end

  def parse_statement(statement)
    tokens = statement.strip.split
    return if tokens.empty?
    p tokens

    case tokens.first
      when 'print'
        @ripper.on_path(tokens[1]) {|el| puts el.text}
      when 'delete'
        @ripper.on_path(tokens[1]) {|el| el.remove}
      when 'replace'
        @ripper.on_path(tokens[1]) {|el| el.text = tokens[2]}
      when 'print_document'
        @ripper.after {|doc| puts doc }
      else
        raise "Unknown keyword '#{tokens.first}'"
    end
  end

  def run(xml_file)
    @ripper.run(xml_file)
  end

end