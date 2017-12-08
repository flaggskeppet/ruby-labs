require_relative 'xml_ripper'

#Use command line:
# > cd D:\git\b360\sandbox\xml_ripper
# > ruby ripper_using_command_line_arguments.rb fix_author.ripper fellowship.xml

r = XMLRipper.new
r.initialize_from_file(ARGV[0])
r.run(ARGV[1])