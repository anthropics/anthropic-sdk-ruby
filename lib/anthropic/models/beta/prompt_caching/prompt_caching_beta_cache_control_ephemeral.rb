# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module PromptCaching
        class PromptCachingBetaCacheControlEphemeral < Anthropic::BaseModel
          # @!attribute type
          #   @return [Symbol, Anthropic::Models::Beta::PromptCaching::PromptCachingBetaCacheControlEphemeral::Type]
          required :type,
                   enum: -> {
                     Anthropic::Models::Beta::PromptCaching::PromptCachingBetaCacheControlEphemeral::Type
                   }

          class Type < Anthropic::Enum
            EPHEMERAL = :ephemeral
          end

          # @!parse
          #   # Create a new instance of PromptCachingBetaCacheControlEphemeral from a Hash of
          #   #   raw data.
          #   #
          #   # @param data [Hash{Symbol => Object}] .
          #   #   @option data [String] :type
          #   def initialize(data = {}) = super
        end
      end

      PromptCachingBetaCacheControlEphemeral = PromptCaching::PromptCachingBetaCacheControlEphemeral
    end
  end
end
