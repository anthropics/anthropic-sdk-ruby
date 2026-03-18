# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaCapabilitySupport < Anthropic::Internal::Type::BaseModel
        # @!attribute supported
        #   Whether this capability is supported by the model.
        #
        #   @return [Boolean]
        required :supported, Anthropic::Internal::Type::Boolean

        # @!method initialize(supported:)
        #   Indicates whether a capability is supported.
        #
        #   @param supported [Boolean] Whether this capability is supported by the model.
      end
    end

    BetaCapabilitySupport = Beta::BetaCapabilitySupport
  end
end
