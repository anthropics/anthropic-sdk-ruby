# frozen_string_literal: true

module Anthropic
  module Models
    class PromptCachingBetaToolUseBlockParam < Anthropic::BaseModel
      # @!attribute [rw] id
      #   @return [String]
      required :id, String

      # @!attribute [rw] input
      #   @return [Object]
      required :input, Anthropic::Unknown

      # @!attribute [rw] name
      #   @return [String]
      required :name, String

      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::PromptCachingBetaToolUseBlockParam::Type]
      required :type, enum: -> { Anthropic::Models::PromptCachingBetaToolUseBlockParam::Type }

      # @!attribute [rw] cache_control
      #   @return [Anthropic::Models::PromptCachingBetaCacheControlEphemeral]
      optional :cache_control, -> { Anthropic::Models::PromptCachingBetaCacheControlEphemeral }

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
end
