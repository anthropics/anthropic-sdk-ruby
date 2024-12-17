# frozen_string_literal: true

module Anthropic
  module Models
    class BetaBillingError < Anthropic::BaseModel
      # @!attribute message
      #
      #   @return [String]
      required :message, String

      # @!attribute type
      #
      #   @return [Symbol, Anthropic::Models::BetaBillingError::Type]
      required :type, enum: -> { Anthropic::Models::BetaBillingError::Type }

      # @!parse
      #   # @param message [String]
      #   # @param type [String]
      #   #
      #   def initialize(message:, type:) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      # @example
      #
      # ```ruby
      # case enum
      # in :billing_error
      #   # ...
      # end
      # ```
      class Type < Anthropic::Enum
        BILLING_ERROR = :billing_error
      end
    end
  end
end
