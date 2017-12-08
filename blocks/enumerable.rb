class Document
  include Enumerable

  def initialize(content)
    @content = content
  end

  def words
    @content.split
  end

  def each
    words.each{|word| yield(word)}
  end
end

# Att includera enumerable ger en massa extra metoder!
doc = Document.new('this is a test testing it')
puts doc.words
puts doc.include?('hej')
puts doc.include?('testing')
puts doc.sort