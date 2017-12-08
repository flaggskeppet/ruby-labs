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
    statement = statement.sub(/#.*/, '')

    # ABOUT THE REGEXES:
    # /replace\s+'(.*?)'\s+'(.*?)'/ Means: Match the word replace and to single qouted strings separated with one or more whitespace

    case statement.strip
      when ''
        # Skip blank lines
      when /print\s+'(.*?)'/
        @ripper.on_path($1) {|el| puts el.text}
      when /delete\s+'(.*?)'/
        @ripper.on_path($1) {|el| el.remove}
      when /replace\s+'(.*?)'\s+'(.*?)'/
        @ripper.on_path($1) {|el| el.text = $2}
      when /uppercase\s+'(.*?)'/
        @ripper.on_path($1) {|el| el.text.upcase}
      when /print_document/
        @ripper.after {|doc| puts doc}
      else
        raise "Don´t know what to do with '#{statement}'"
    end
  end

  def run(xml_file)
    @ripper.run(xml_file)
  end

end