# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaCacheControlEphemeral < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :ephemeral]
        required :type, const: :ephemeral

        # @!method initialize(type: :ephemeral)
        #   @param type [Symbol, :ephemeral]
      end
    end

    BetaCacheControlEphemeral = Beta::BetaCacheControlEphemeral
  end
end
