require 'redcarpet'

class HTMLwithMathJax < Redcarpet::Render::HTML
  def initialize(options={})
    @@counter = 0
    @@limit = options[:truncate]
    logger.warn 'ABC'
    logger.info options.inspect
    super
  end

  def block_code(code, language)
    if language == 'mathjax'
      "<script type=\"math/tex; mode=display\">
        #{code}
      </script>"
    else
      "<pre><code class=\"#{language}\">#{code}</code></pre>"
    end
  end

  def paragraph(text)
    if not @@limit
      return text
    end

    # if @@counter < @@limit
    #   @@counter += text.length
    #   text
    # end
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