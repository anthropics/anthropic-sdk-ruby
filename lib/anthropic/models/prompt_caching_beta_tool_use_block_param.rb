# frozen_string_literal: true

module Anthropic
  module Models
    class PromptCachingBetaToolUseBlockParam < BaseModel
      # @!attribute [rw] id
      #   @return [String]
      required :id, String

      # @!attribute [rw] input
      #   @return [Object]
      required :input, Anthropic::Unknown

      # @!attribute [rw] name_
      #   @return [String]
      required :name_, String

      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::PromptCachingBetaToolUseBlockParam::Type]
      required :type, enum: -> { Anthropic::Models::PromptCachingBetaToolUseBlockParam::Type }

      # @!attribute [rw] cache_control
      #   @return [Anthropic::Models::PromptCachingBetaCacheControlEphemeral]
      optional :cache_control, -> { Anthropic::Models::PromptCachingBetaCacheControlEphemeral }

      class Type < Anthropic::Enum
        TOOL_USE = :tool_use
      end
    end
  end
end
