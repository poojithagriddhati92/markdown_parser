# frozen_string_literal: true

require_relative './base_parser'

module Parsers
  class HeaderParser < Parsers::BaseParser
    PATTERN = /^(\#{1,})\s+(.*)$/
    # ^ Start 
      # ( Capture group
      # \#{1,} Match a # character 1 or more times
      # )
        # \s+ One ore more of whitespaces
      # ( Capture group
        #.* Match anything except line breaks 0 or more times
      # )

    def initialize
      super(PATTERN)
    end

    def match(markdown_string)
      markdown_string.gsub!(pattern) do |_|
        header_level = Regexp.last_match(1)&.count '#'
        if header_level > 6
          raise StandardError.new("Invalid string to parse")
        end
        "<h#{header_level}>#{Regexp.last_match(2)}</h#{header_level}>"
      end
      markdown_string
    end
  end
end
