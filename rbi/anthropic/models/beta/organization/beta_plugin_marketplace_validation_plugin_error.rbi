# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaPluginMarketplaceValidationPluginError < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaPluginMarketplaceValidationPluginError,
                Anthropic::Internal::AnyHash
              )
            end

          # Why the plugin would be skipped by a synchronization.
          sig { returns(String) }
          attr_accessor :error

          # A stable identifier for the reason — the value to branch on.
          sig { returns(String) }
          attr_accessor :error_code

          # The plugin's name, as its entry in marketplace.json declares it.
          sig { returns(String) }
          attr_accessor :name

          sig do
            params(error: String, error_code: String, name: String).returns(
              T.attached_class
            )
          end
          def self.new(
            # Why the plugin would be skipped by a synchronization.
            error:,
            # A stable identifier for the reason — the value to branch on.
            error_code:,
            # The plugin's name, as its entry in marketplace.json declares it.
            name:
          )
          end

          sig do
            override.returns(
              { error: String, error_code: String, name: String }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
