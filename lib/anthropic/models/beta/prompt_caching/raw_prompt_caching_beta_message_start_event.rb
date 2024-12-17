# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module PromptCaching
        class RawPromptCachingBetaMessageStartEvent < Anthropic::BaseModel
          # @!attribute message
          #
          #   @return [Anthropic::Models::Beta::PromptCaching::PromptCachingBetaMessage]
          required :message, -> { Anthropic::Models::Beta::PromptCaching::PromptCachingBetaMessage }

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::PromptCaching::RawPromptCachingBetaMessageStartEvent::Type]
          required :type,
                   enum: -> {
                     Anthropic::Models::Beta::PromptCaching::RawPromptCachingBetaMessageStartEvent::Type
                   }

          # @!parse
          #   # @param message [Anthropic::Models::Beta::PromptCaching::PromptCachingBetaMessage]
          #   # @param type [String]
          #   #
          #   def initialize(message:, type:) = super

          # def initialize: (Hash | Anthropic::BaseModel) -> void

          # @example
          #
          # ```ruby
          # case enum
          # in :message_start
          #   # ...
          # end
          # ```
          class Type < Anthropic::Enum
            MESSAGE_START = :message_start
          end
        end
      end
    end
  end
end
