# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaUnrestrictedNetwork < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #   Network policy type
        #
        #   @return [Symbol, :unrestricted]
        required :type, const: :unrestricted

        # @!method initialize(type: :unrestricted)
        #   Unrestricted network access.
        #
        #   @param type [Symbol, :unrestricted] Network policy type
      end
    end

    BetaUnrestrictedNetwork = Beta::BetaUnrestrictedNetwork
  end
end
