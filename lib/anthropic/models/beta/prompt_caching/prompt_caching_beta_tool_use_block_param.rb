# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module PromptCaching
        class PromptCachingBetaToolUseBlockParam < Anthropic::BaseModel
          # @!attribute id
          #   @return [String]
          required :id, String

          # @!attribute input
          #   @return [Object]
          required :input, Anthropic::Unknown

          # @!attribute name
          #   @return [String]
          required :name, String

          # @!attribute type
          #   @return [Symbol, Anthropic::Models::Beta::PromptCaching::PromptCachingBetaToolUseBlockParam::Type]
          required :type,
                   enum: -> {
                     Anthropic::Models::Beta::PromptCaching::PromptCachingBetaToolUseBlockParam::Type
                   }

          # @!attribute cache_control
          #   @return [Anthropic::Models::Beta::PromptCaching::PromptCachingBetaCacheControlEphemeral]
          optional :cache_control,
                   -> { Anthropic::Models::Beta::PromptCaching::PromptCachingBetaCacheControlEphemeral }

          class Type < Anthropic::Enum
            TOOL_USE = :tool_use
          end

          # @!parse
          #   # Create a new instance of PromptCachingBetaToolUseBlockParam from a Hash of raw
          #   #   data.
          #   #
          #   # @param data [Hash{Symbol => Object}] .
          #   #   @option data [String] :id
          #   #   @option data [Object] :input
          #   #   @option data [String] :name
          #   #   @option data [String] :type
          #   #   @option data [Object, nil] :cache_control
          #   def initialize(data = {}) = super
        end
      end

      PromptCachingBetaToolUseBlockParam = PromptCaching::PromptCachingBetaToolUseBlockParam
    end
  end
end
