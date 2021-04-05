module Jekyll
  class IncludeFileTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @text = text.strip
    end
    def render(context)
      tmpl = File.read File.join Dir.pwd, @text
      # simply return the text, as is, from the file
      tmpl
    end
  end
end
Liquid::Template.register_tag('includefile', Jekyll::IncludeFileTag)
