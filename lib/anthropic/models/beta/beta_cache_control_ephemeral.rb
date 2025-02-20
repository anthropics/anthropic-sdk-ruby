# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaCacheControlEphemeral < Anthropic::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :ephemeral]
        required :type, const: :ephemeral

        # @!parse
        #   # @param type [Symbol, :ephemeral]
        #   #
        #   def initialize(type: :ephemeral, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void
      end
    end

    BetaCacheControlEphemeral = Beta::BetaCacheControlEphemeral
  end
end
