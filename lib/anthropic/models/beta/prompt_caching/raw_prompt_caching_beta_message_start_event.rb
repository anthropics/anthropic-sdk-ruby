# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module PromptCaching
        class RawPromptCachingBetaMessageStartEvent < Anthropic::BaseModel
          # @!attribute message
          #   @return [Anthropic::Models::Beta::PromptCaching::PromptCachingBetaMessage]
          required :message, -> { Anthropic::Models::Beta::PromptCaching::PromptCachingBetaMessage }

          # @!attribute type
          #   @return [Symbol, Anthropic::Models::Beta::PromptCaching::RawPromptCachingBetaMessageStartEvent::Type]
          required :type,
                   enum: -> {
                     Anthropic::Models::Beta::PromptCaching::RawPromptCachingBetaMessageStartEvent::Type
                   }

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
  end
end
