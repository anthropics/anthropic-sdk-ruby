# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaCacheControlEphemeral < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :ephemeral]
        required :type, const: :ephemeral

        # @!parse
        #   # @param type [Symbol, :ephemeral]
        #   #
        #   def initialize(type: :ephemeral, **) = super

        # def initialize: (Hash | Anthropic::Internal::Type::BaseModel) -> void
      end
    end

    BetaCacheControlEphemeral = Beta::BetaCacheControlEphemeral
  end
end
