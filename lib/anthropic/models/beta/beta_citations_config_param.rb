# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaCitationsConfigParam < Anthropic::Internal::Type::BaseModel
        # @!attribute enabled
        #
        #   @return [Boolean, nil]
        optional :enabled, Anthropic::Internal::Type::Boolean

        # @!method initialize(enabled: nil)
        #   @param enabled [Boolean]
      end
    end

    BetaCitationsConfigParam = Beta::BetaCitationsConfigParam
  end
end
