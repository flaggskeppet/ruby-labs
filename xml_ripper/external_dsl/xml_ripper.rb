require "rexml/document"

class XMLRipper
  def initialize(&block)
    @path_actions = {}
    @after_action = proc {}
    @before_action = proc {}
    instance_eval(&block) if block_given? # instead of 'block.call(self) if block'.  instance_eval changes value of self
  end

  def initialize_from_file(path)
    instance_eval(File.read(path))
  end

  def on_path(path, &block)
    puts "Added block for '#{path}'"
    @path_actions[path] = block
  end

  def run(path)
    File.open(path) do |f|
      doc = REXML::Document.new(f)
      @before_action.call doc
      run_path_actions doc
      @after_action.call doc
    end
  end

  def after(&block)
    @after_action = block
  end

  def before(&block)
    @before_action = block
  end

  def run_path_actions(document)
    @path_actions.each do |path, block|
      REXML::XPath.each(document, path) do |el|
        block.call el
      end
    end
  end

  def method_missing(name, *args, &block)
    return super unless name.to_s =~ /on_.*/
    parts = name.to_s.split("_")
    parts.shift
    xpath = parts.join '/'
    on_path(xpath, &block)
  end
end