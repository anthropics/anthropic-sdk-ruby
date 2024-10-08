# frozen_string_literal: true

module Anthropic
  module Models
    class BetaCacheControlEphemeral < BaseModel
      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::BetaCacheControlEphemeral::Type]
      required :type, enum: -> { Anthropic::Models::BetaCacheControlEphemeral::Type }

      class Type < Anthropic::Enum
        EPHEMERAL = :ephemeral
      end
    end
  end
end
