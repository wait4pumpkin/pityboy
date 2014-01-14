# lib/haml/filters/markdownEx.rb
module Haml::Filters::MarkdownEx
  include Haml::Filters::Base

  require 'redcarpet/compat'

  def render(text)
    markdown = Redcarpet::Markdown.new(HTMLwithMathJax, :prettify => true, 
                                       :disable_indented_code_blocks => true, 
                                       :fenced_code_blocks => true)
    HTML_Truncator.truncate(markdown.render(text), 30)
  end
end