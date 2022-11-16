require_relative './base_parser'

module Parsers
  class LinkParser < Parsers::BaseParser
    PATTERN = /([^!])\[([^\[]+)\]\(([^)]+)\)/
    #( capture group
      # [^!] Match any character except `!`
    #)
    #[ Matches `[` character
      #( capture group
        # [^\[]+ Match any character except `[`
      #)
    #\] Matches `]` character
    # \( Matches `(` character
      #( capture group
        # [^)]+) Match any character except `)`
      #\)


    def initialize
      super(PATTERN)
    end

    def match(markdown_string)
      markdown_string.gsub!(pattern) do |_|
        "#{Regexp.last_match(1)}<a href=\"#{Regexp.last_match(3)}\">#{Regexp.last_match(2)}</a>"
      end
      markdown_string
    end
  end
end
