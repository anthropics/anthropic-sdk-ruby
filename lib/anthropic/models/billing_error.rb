# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    #
    # ```ruby
    # billing_error => {
    #   message: String,
    #   type: enum: Anthropic::Models::BillingError::Type
    # }
    # ```
    class BillingError < Anthropic::BaseModel
      # @!attribute message
      #
      #   @return [String]
      required :message, String

      # @!attribute type
      #
      #   @return [Symbol, Anthropic::Models::BillingError::Type]
      required :type, enum: -> { Anthropic::Models::BillingError::Type }

      # @!parse
      #   # @param message [String]
      #   # @param type [String]
      #   #
      #   def initialize(message:, type:, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      # @example
      #
      # ```ruby
      # case type
      # in :billing_error
      #   # ...
      # end
      # ```
      class Type < Anthropic::Enum
        BILLING_ERROR = :billing_error

        finalize!
      end
    end
  end
end
