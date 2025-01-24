# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    # ```ruby
    # cache_control_ephemeral => {
    #   type: :ephemeral
    # }
    # ```
    class CacheControlEphemeral < Anthropic::BaseModel
      # @!attribute type
      #
      #   @return [Symbol, :ephemeral]
      required :type, const: :ephemeral

      # @!parse
      #   # @param type [String]
      #   #
      #   def initialize(type: :ephemeral, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void
    end
  end
end
