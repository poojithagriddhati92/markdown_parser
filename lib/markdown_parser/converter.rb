require_relative './parsers/header_parser'
require_relative './parsers/paragraph_parser'
require_relative './parsers/link_parser'

module MarkdownParser
  class Converter
    attr_accessor :markdown_string

    # Allows more inline tags within
    # Headers and paragraph are only required for assessment
    # Add to this if more tags are required
    BLOCK_TAGS = %w[HeaderParser ParagraphParser]

    # Doesn't allow any other tags within
    # links are only required for assessment
    # Add to this if more tags are required
    INLINE_TAGS = %w[LinkParser]

    ALL_TAGS = [
      BLOCK_TAGS,
      INLINE_TAGS
    ].flatten!

    # Initialize with @param String
    def initialize(markdown_string)
      @markdown_string = markdown_string
    end

    # Return String
    # Loop through each tag and markup
    def to_html
      ALL_TAGS.each do |tag|
        ::Parsers.const_get(tag).new.match(markdown_string)
      end
      markdown_string
    end
  end
end
