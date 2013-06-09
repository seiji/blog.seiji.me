module Jekyll
  require 'haml'

  class HamlConverter < Converter
    safe true
    priority :low
    
    def setup
      return if @setup
      require 'haml'
      @setup = true
    rescue
      STDERR.puts 'do `gem install haml`'
      raise FatalException.new("Missing dependency: haml")
    end

    def matches(ext)
      ext =~ /haml/i
    end

    def output_ext(ext)
      ".html"
    end

    def convert(content)
      setup
      engine = Haml::Engine.new(content)
      engine.render
    end
  end
end
