# frozen_string_literal: true

module Anthropic
  module Models
    class PromptCachingBetaTextBlockParam < BaseModel
      # @!attribute [rw] text
      #   @return [String]
      required :text, String

      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::PromptCachingBetaTextBlockParam::Type]
      required :type, enum: -> { Anthropic::Models::PromptCachingBetaTextBlockParam::Type }

      # @!attribute [rw] cache_control
      #   @return [Anthropic::Models::PromptCachingBetaCacheControlEphemeral]
      optional :cache_control, -> { Anthropic::Models::PromptCachingBetaCacheControlEphemeral }

      class Type < Anthropic::Enum
        TEXT = :text
      end

      # Create a new instance of PromptCachingBetaTextBlockParam from a Hash of raw
      #   data.
      #
      # @overload initialize(text: nil, type: nil, cache_control: nil)
      # @param text [String]
      # @param type [String]
      # @param cache_control [Object]
      def initialize(data = {})
        super
      end
    end
  end
end
