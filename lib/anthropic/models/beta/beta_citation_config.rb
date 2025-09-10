# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaCitationConfig < Anthropic::Internal::Type::BaseModel
        # @!attribute enabled
        #
        #   @return [Boolean]
        required :enabled, Anthropic::Internal::Type::Boolean

        # @!method initialize(enabled:)
        #   @param enabled [Boolean]
      end
    end

    BetaCitationConfig = Beta::BetaCitationConfig
  end
end
