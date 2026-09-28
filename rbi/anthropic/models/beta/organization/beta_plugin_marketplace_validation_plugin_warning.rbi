# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaPluginMarketplaceValidationPluginWarning < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaPluginMarketplaceValidationPluginWarning,
                Anthropic::Internal::AnyHash
              )
            end

          # A stable identifier for the kind of warning.
          sig { returns(String) }
          attr_accessor :error_code

          # What would be left out, and why.
          sig { returns(String) }
          attr_accessor :message

          sig do
            params(error_code: String, message: String).returns(
              T.attached_class
            )
          end
          def self.new(
            # A stable identifier for the kind of warning.
            error_code:,
            # What would be left out, and why.
            message:
          )
          end

          sig { override.returns({ error_code: String, message: String }) }
          def to_hash
          end
        end
      end
    end
  end
end
