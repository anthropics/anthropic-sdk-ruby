# frozen_string_literal: true

module Anthropic
  module Models
    class PromptCachingBetaTextBlockParam < Anthropic::BaseModel
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
end
