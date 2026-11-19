# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeCode
          class BetaCMEKFeatureUnsupportedErrorDetails < Anthropic::Internal::Type::BaseModel
            # @!attribute error_code
            #
            #   @return [Symbol, :cmek_feature_unsupported]
            required :error_code, const: :cmek_feature_unsupported

            # @!method initialize(error_code: :cmek_feature_unsupported)
            #   This stored settings document currently cannot be read or replaced. Contact
            #   support, or, if you no longer need these settings, delete the group's settings
            #   or clear the default.
            #
            #   @param error_code [Symbol, :cmek_feature_unsupported]
          end
        end
      end
    end
  end
end
