require_relative './base_parser'

module Parsers
  class ParagraphParser < Parsers::BaseParser
    PATTERN = /^(?!<\/?\w+>|\s?\*|\s?[0-9]+|>)([^\n\n]+)/
    # ^ Begining
      # (?! Specifies a group that cannot match
      # < Match character `<`
      # \/? Match between 0 and 1 of `/`
      # \w+ Matches one or of word character
      # > Match character `>`
      # | OR
      # \s? Match between 1 and 0 of whitespace 
      # \* Match character `*`
      # | OR
      # \s? Match between 1 and 0 of whitespace 
      # [0-9]+ Match a character between 0 to 9
      # | OR
      # > Match character `>`
    # ) 
    #([^\n\n]+) Match all characters except two newlines


    def initialize
      super(PATTERN)
    end

    # @param markdown_string String
    def match(markdown_string)
      markdown_string.gsub!(pattern) do |_|
        "<p>#{Regexp.last_match(1)}</p>"
      end
      markdown_string.gsub!(%r{</p>\n<p>}, "\n")
    end
  end
end
