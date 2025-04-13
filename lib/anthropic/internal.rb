# frozen_string_literal: true

module Anthropic
  # @api private
  module Internal
    OMIT =
      Object.new.tap do
        _1.define_singleton_method(:inspect) { "#<#{Anthropic::Internal}::OMIT>" }
      end
        .freeze
  end
end
