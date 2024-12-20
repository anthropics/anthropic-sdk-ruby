# frozen_string_literal: true

module Anthropic
  module Models
    class BetaGatewayTimeoutError < Anthropic::BaseModel
      # @!attribute message
      #
      #   @return [String]
      required :message, String

      # @!attribute type
      #
      #   @return [Symbol, Anthropic::Models::BetaGatewayTimeoutError::Type]
      required :type, enum: -> { Anthropic::Models::BetaGatewayTimeoutError::Type }

      # @!parse
      #   # @param message [String]
      #   # @param type [String]
      #   #
      #   def initialize(message:, type:, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      # @example
      #
      # ```ruby
      # case enum
      # in :timeout_error
      #   # ...
      # end
      # ```
      class Type < Anthropic::Enum
        TIMEOUT_ERROR = :timeout_error

        finalize!
      end
    end
  end
end
