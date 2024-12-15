# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module PromptCaching
        class PromptCachingBetaToolResultBlockParam < Anthropic::BaseModel
          # @!attribute tool_use_id
          #
          #   @return [String]
          required :tool_use_id, String

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::PromptCaching::PromptCachingBetaToolResultBlockParam::Type]
          required :type,
                   enum: -> {
                     Anthropic::Models::Beta::PromptCaching::PromptCachingBetaToolResultBlockParam::Type
                   }

          # @!attribute cache_control
          #
          #   @return [Anthropic::Models::Beta::PromptCaching::PromptCachingBetaCacheControlEphemeral]
          optional :cache_control,
                   -> { Anthropic::Models::Beta::PromptCaching::PromptCachingBetaCacheControlEphemeral }

          # @!attribute content
          #
          #   @return [Array<Anthropic::Models::Beta::PromptCaching::PromptCachingBetaImageBlockParam, Anthropic::Models::Beta::PromptCaching::PromptCachingBetaTextBlockParam>, String]
          optional :content, Anthropic::Unknown

          # @!attribute is_error
          #
          #   @return [Boolean]
          optional :is_error, Anthropic::BooleanModel

          # @!parse
          #   # @param tool_use_id [String]
          #   # @param type [String]
          #   # @param cache_control [Object, nil]
          #   # @param content [Array<Object>, String, nil]
          #   # @param is_error [Boolean, nil]
          #   #
          #   def initialize(tool_use_id:, type:, cache_control: nil, content: nil, is_error: nil) = super

          # def initialize: (Hash | Anthropic::BaseModel) -> void

          class Type < Anthropic::Enum
            TOOL_RESULT = :tool_result
          end
        end
      end

      PromptCachingBetaToolResultBlockParam = PromptCaching::PromptCachingBetaToolResultBlockParam
    end
  end
end
