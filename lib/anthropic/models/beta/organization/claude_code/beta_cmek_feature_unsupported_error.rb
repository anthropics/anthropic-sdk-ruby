# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeCode
          # This stored settings document currently cannot be read or replaced. Contact
          # support, or, if you no longer need these settings, delete the group's settings
          # or clear the default.
          class BetaCMEKFeatureUnsupportedError < Anthropic::Errors::BadRequestError
            # @!method error_code
            #   @return [Symbol, :cmek_feature_unsupported]

            # @return [Anthropic::Models::Beta::Organization::ClaudeCode::BetaCMEKFeatureUnsupportedErrorDetails]
            def details
              Anthropic::Internal::Type::Converter.coerce(
                Anthropic::Beta::Organization::ClaudeCode::BetaCMEKFeatureUnsupportedErrorDetails,
                Anthropic::Internal::Util.dig(body, [:error, :details])
              )
            end
          end
        end
      end
    end
  end
end
