require_relative '../../lib/markdown_parser/converter'

class MarkdownParserController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render :index
  end

  def parse
    text = request.raw_post
    @converted_text = ::MarkdownParser::Converter.new(text).to_html
    render :parse
  end
end
