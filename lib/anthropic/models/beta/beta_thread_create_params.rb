# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaThreadCreateParams < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :create]
        required :type, const: :create

        # @!method initialize(type: :create)
        #   Start holding conversation state under this response's `id`.
        #
        #   @param type [Symbol, :create]
      end
    end

    BetaThreadCreateParams = Beta::BetaThreadCreateParams
  end
end
