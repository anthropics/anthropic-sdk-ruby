# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaSelfHostedConfigParams < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #   Environment type
        #
        #   @return [Symbol, :self_hosted]
        required :type, const: :self_hosted

        # @!method initialize(type: :self_hosted)
        #   Request params for `self_hosted` environment configuration.
        #
        #   @param type [Symbol, :self_hosted] Environment type
      end
    end

    BetaSelfHostedConfigParams = Beta::BetaSelfHostedConfigParams
  end
end
