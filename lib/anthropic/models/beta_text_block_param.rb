# frozen_string_literal: true

module Anthropic
  module Models
    class BetaTextBlockParam < BaseModel
      # @!attribute [rw] text
      #   @return [String]
      required :text, String

      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::BetaTextBlockParam::Type]
      required :type, enum: -> { Anthropic::Models::BetaTextBlockParam::Type }

      # @!attribute [rw] cache_control
      #   @return [Anthropic::Models::BetaCacheControlEphemeral]
      optional :cache_control, -> { Anthropic::Models::BetaCacheControlEphemeral }

      class Type < Anthropic::Enum
        TEXT = :text
      end
    end
  end
end
