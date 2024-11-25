# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module PromptCaching
        class PromptCachingBetaTextBlockParam < Anthropic::BaseModel
          # @!attribute [rw] text
          #   @return [String]
          required :text, String

          # @!attribute [rw] type
          #   @return [Symbol, Anthropic::Models::Beta::PromptCaching::PromptCachingBetaTextBlockParam::Type]
          required :type,
                   enum: -> {
                     Anthropic::Models::Beta::PromptCaching::PromptCachingBetaTextBlockParam::Type
                   }

          # @!attribute [rw] cache_control
          #   @return [Anthropic::Models::Beta::PromptCaching::PromptCachingBetaCacheControlEphemeral]
          optional :cache_control,
                   -> { Anthropic::Models::Beta::PromptCaching::PromptCachingBetaCacheControlEphemeral }

          class Type < Anthropic::Enum
            TEXT = :text
          end

          # @!parse
          #   # Create a new instance of PromptCachingBetaTextBlockParam from a Hash of raw
          #   #   data.
          #   #
          #   # @param data [Hash{Symbol => Object}] .
          #   #   @option data [String] :text
          #   #   @option data [String] :type
          #   #   @option data [Object, nil] :cache_control
          #   def initialize(data = {}) = super
        end
      end

      PromptCachingBetaTextBlockParam = PromptCaching::PromptCachingBetaTextBlockParam
    end
  end
end
