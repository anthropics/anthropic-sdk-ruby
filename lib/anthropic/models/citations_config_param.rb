# frozen_string_literal: true

module Anthropic
  module Models
    class CitationsConfigParam < Anthropic::Internal::Type::BaseModel
      # @!attribute [r] enabled
      #
      #   @return [Boolean, nil]
      optional :enabled, Anthropic::Internal::Type::Boolean

      # @!parse
      #   # @return [Boolean]
      #   attr_writer :enabled

      # @!method initialize(enabled: nil)
      #   @param enabled [Boolean]
    end
  end
end
