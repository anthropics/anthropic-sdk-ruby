# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module PromptCaching
        class PromptCachingBetaTextBlockParam < Anthropic::BaseModel
          # @!attribute text
          #
          #   @return [String]
          required :text, String

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::PromptCaching::PromptCachingBetaTextBlockParam::Type]
          required :type,
                   enum: -> {
                     Anthropic::Models::Beta::PromptCaching::PromptCachingBetaTextBlockParam::Type
                   }

          # @!attribute cache_control
          #
          #   @return [Anthropic::Models::Beta::PromptCaching::PromptCachingBetaCacheControlEphemeral]
          optional :cache_control,
                   -> { Anthropic::Models::Beta::PromptCaching::PromptCachingBetaCacheControlEphemeral }

          # @!parse
          #   # @param text [String]
          #   # @param type [String]
          #   # @param cache_control [Anthropic::Models::Beta::PromptCaching::PromptCachingBetaCacheControlEphemeral, nil]
          #   #
          #   def initialize(text:, type:, cache_control: nil) = super

          # def initialize: (Hash | Anthropic::BaseModel) -> void

          class Type < Anthropic::Enum
            TEXT = :text
          end
        end
      end

      PromptCachingBetaTextBlockParam = PromptCaching::PromptCachingBetaTextBlockParam
    end
  end
end
