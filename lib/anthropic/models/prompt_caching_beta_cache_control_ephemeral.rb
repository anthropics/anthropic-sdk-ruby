# frozen_string_literal: true

module Anthropic
  module Models
    class PromptCachingBetaCacheControlEphemeral < BaseModel
      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::PromptCachingBetaCacheControlEphemeral::Type]
      required :type, enum: -> { Anthropic::Models::PromptCachingBetaCacheControlEphemeral::Type }

      class Type < Anthropic::Enum
        EPHEMERAL = :ephemeral
      end
    end
  end
end
