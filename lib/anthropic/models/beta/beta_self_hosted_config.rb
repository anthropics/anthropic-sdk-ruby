# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaSelfHostedConfig < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #   Environment type
        #
        #   @return [Symbol, :self_hosted]
        required :type, const: :self_hosted

        # @!method initialize(type: :self_hosted)
        #   Configuration for self-hosted environments.
        #
        #   @param type [Symbol, :self_hosted] Environment type
      end
    end

    BetaSelfHostedConfig = Beta::BetaSelfHostedConfig
  end
end
