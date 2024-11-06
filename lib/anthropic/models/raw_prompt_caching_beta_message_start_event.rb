# frozen_string_literal: true

module Anthropic
  module Models
    class RawPromptCachingBetaMessageStartEvent < Anthropic::BaseModel
      # @!attribute [rw] message
      #   @return [Anthropic::Models::PromptCachingBetaMessage]
      required :message, -> { Anthropic::Models::PromptCachingBetaMessage }

      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::RawPromptCachingBetaMessageStartEvent::Type]
      required :type, enum: -> { Anthropic::Models::RawPromptCachingBetaMessageStartEvent::Type }

      class Type < Anthropic::Enum
        MESSAGE_START = :message_start
      end

      # @!parse
      #   # Create a new instance of RawPromptCachingBetaMessageStartEvent from a Hash of
      #   #   raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [Object] :message
      #   #   @option data [String] :type
      #   def initialize(data = {}) = super
    end
  end
end
