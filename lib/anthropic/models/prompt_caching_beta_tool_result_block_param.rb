# frozen_string_literal: true

module Anthropic
  module Models
    class PromptCachingBetaToolResultBlockParam < BaseModel
      # @!attribute [rw] tool_use_id
      #   @return [String]
      required :tool_use_id, String

      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::PromptCachingBetaToolResultBlockParam::Type]
      required :type, enum: -> { Anthropic::Models::PromptCachingBetaToolResultBlockParam::Type }

      # @!attribute [rw] cache_control
      #   @return [Anthropic::Models::PromptCachingBetaCacheControlEphemeral]
      optional :cache_control, -> { Anthropic::Models::PromptCachingBetaCacheControlEphemeral }

      # @!attribute [rw] content
      #   @return [Array<Anthropic::Models::PromptCachingBetaImageBlockParam, Anthropic::Models::PromptCachingBetaTextBlockParam>, String]
      optional :content, Anthropic::Unknown

      # @!attribute [rw] is_error
      #   @return [Boolean]
      optional :is_error, Anthropic::BooleanModel

      class Type < Anthropic::Enum
        TOOL_RESULT = :tool_result
      end
    end
  end
end
