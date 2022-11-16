# frozen_string_literal: true

module Parsers
  class BaseParser
    attr_accessor :pattern

    # Initialize with child pattern
    def initialize(pattern)
      @pattern = pattern
    end

    def match(_str)
      raise NoMethodError, 'Should implement Match method'
    end
  end
end
