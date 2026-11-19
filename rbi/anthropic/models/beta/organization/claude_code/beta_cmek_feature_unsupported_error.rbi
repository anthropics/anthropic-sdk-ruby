# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeCode
          # This stored settings document currently cannot be read or replaced. Contact
          # support, or, if you no longer need these settings, delete the group's settings
          # or clear the default.
          class BetaCMEKFeatureUnsupportedError < Anthropic::Errors::BadRequestError
            sig { returns(Symbol) }
            def error_code
            end

            sig do
              returns(
                Anthropic::Beta::Organization::ClaudeCode::BetaCMEKFeatureUnsupportedErrorDetails
              )
            end
            def details
            end
          end
        end
      end
    end
  end
end
