require 'redcarpet'

class HTMLwithMathJax < Redcarpet::Render::HTML
  def block_code(code, language)
    if language == 'mathjax'
      "<script type=\"math/tex; mode=display\">
        #{code}
      </script>"
    else
      'abc'
      "<pre><code class=\"#{language}\">#{code}</code></pre>"
    end
  end
  
  def codespan(code)
    if code[0] == "$" && code[-1] == "$"
      code.gsub!(/^\$/,'')
      code.gsub!(/\$$/,'')
      "<script type=\"math/tex\">#{code}</script>"
    else
      "<code>#{code}</code>"
    end
  end
end