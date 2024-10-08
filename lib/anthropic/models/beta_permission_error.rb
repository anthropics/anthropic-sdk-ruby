# frozen_string_literal: true

module Anthropic
  module Models
    class BetaPermissionError < BaseModel
      # @!attribute [rw] message
      #   @return [String]
      required :message, String

      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::BetaPermissionError::Type]
      required :type, enum: -> { Anthropic::Models::BetaPermissionError::Type }

      class Type < Anthropic::Enum
        PERMISSION_ERROR = :permission_error
      end
    end
  end
end
