# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaPluginMarketplaceValidationPluginWarnings < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaPluginMarketplaceValidationPluginWarnings,
                Anthropic::Internal::AnyHash
              )
            end

          # The plugin's name, as its entry in marketplace.json declares it.
          sig { returns(String) }
          attr_accessor :name

          # The parts of the plugin a synchronization would leave out.
          sig do
            returns(
              T::Array[
                Anthropic::Beta::Organization::BetaPluginMarketplaceValidationPluginWarning
              ]
            )
          end
          attr_accessor :warnings

          sig do
            params(
              name: String,
              warnings:
                T::Array[
                  Anthropic::Beta::Organization::BetaPluginMarketplaceValidationPluginWarning::OrHash
                ]
            ).returns(T.attached_class)
          end
          def self.new(
            # The plugin's name, as its entry in marketplace.json declares it.
            name:,
            # The parts of the plugin a synchronization would leave out.
            warnings:
          )
          end

          sig do
            override.returns(
              {
                name: String,
                warnings:
                  T::Array[
                    Anthropic::Beta::Organization::BetaPluginMarketplaceValidationPluginWarning
                  ]
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
