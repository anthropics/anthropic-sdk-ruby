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

      # Create a new instance of PromptCachingBetaToolUseBlockParam from a Hash of raw
      #   data.
      #
      # @overload initialize(id: nil, input: nil, name: nil, type: nil, cache_control: nil)
      # @param id [String]
      # @param input [Object]
      # @param name [String]
      # @param type [String]
      # @param cache_control [Object]
      def initialize(data = {})
        super
      end
    end
  end
end
