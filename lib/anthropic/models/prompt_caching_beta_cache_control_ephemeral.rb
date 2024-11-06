# frozen_string_literal: true

module Anthropic
  module Models
    class PromptCachingBetaCacheControlEphemeral < Anthropic::BaseModel
      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::PromptCachingBetaCacheControlEphemeral::Type]
      required :type, enum: -> { Anthropic::Models::PromptCachingBetaCacheControlEphemeral::Type }

      class Type < Anthropic::Enum
        EPHEMERAL = :ephemeral
      end

      # @!parse
      #   # Create a new instance of PromptCachingBetaCacheControlEphemeral from a Hash of
      #   #   raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [String] :type
      #   def initialize(data = {}) = super
    end
  end
end
