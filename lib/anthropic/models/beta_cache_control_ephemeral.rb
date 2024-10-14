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

      # Create a new instance of BetaCacheControlEphemeral from a Hash of raw data.
      #
      # @overload initialize(type: nil)
      # @param type [String]
      def initialize(data = {})
        super
      end
    end
  end
end
