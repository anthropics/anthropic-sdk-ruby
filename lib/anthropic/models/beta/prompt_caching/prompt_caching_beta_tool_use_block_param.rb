# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module PromptCaching
        class PromptCachingBetaToolUseBlockParam < Anthropic::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute input
          #
          #   @return [Object]
          required :input, Anthropic::Unknown

          # @!attribute name
          #
          #   @return [String]
          required :name, String

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::PromptCaching::PromptCachingBetaToolUseBlockParam::Type]
          required :type,
                   enum: -> {
                     Anthropic::Models::Beta::PromptCaching::PromptCachingBetaToolUseBlockParam::Type
                   }

          # @!attribute cache_control
          #
          #   @return [Anthropic::Models::Beta::PromptCaching::PromptCachingBetaCacheControlEphemeral]
          optional :cache_control,
                   -> { Anthropic::Models::Beta::PromptCaching::PromptCachingBetaCacheControlEphemeral }

          # @!parse
          #   # @param id [String]
          #   # @param input [Object]
          #   # @param name [String]
          #   # @param type [String]
          #   # @param cache_control [Anthropic::Models::Beta::PromptCaching::PromptCachingBetaCacheControlEphemeral, nil]
          #   #
          #   def initialize(id:, input:, name:, type:, cache_control: nil) = super

          # def initialize: (Hash | Anthropic::BaseModel) -> void

          class Type < Anthropic::Enum
            TOOL_USE = :tool_use
          end
        end
      end

      PromptCachingBetaToolUseBlockParam = PromptCaching::PromptCachingBetaToolUseBlockParam
    end
  end
end
