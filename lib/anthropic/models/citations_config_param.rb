# frozen_string_literal: true

module Anthropic
  module Models
    class CitationsConfigParam < Anthropic::Internal::Type::BaseModel
      # @!attribute enabled
      #
      #   @return [Boolean, nil]
      optional :enabled, Anthropic::Internal::Type::Boolean

      # @!method initialize(enabled: nil)
      #   @param enabled [Boolean]
    end
  end
end
