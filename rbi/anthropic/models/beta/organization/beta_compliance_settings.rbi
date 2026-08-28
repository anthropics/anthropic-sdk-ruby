# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaComplianceSettings < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaComplianceSettings,
                Anthropic::Internal::AnyHash
              )
            end

          # Whether the Compliance API is enabled for this organization.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaComplianceSettings::State::Variants
            )
          end
          attr_accessor :state

          sig { returns(Symbol) }
          attr_accessor :type

          sig do
            params(
              state:
                T.any(
                  Anthropic::Beta::Organization::BetaComplianceSettingsStateEnabled::OrHash,
                  Anthropic::Beta::Organization::BetaComplianceSettingsStateDisabled::OrHash
                ),
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Whether the Compliance API is enabled for this organization.
            state:,
            type: :compliance_settings
          )
          end

          sig do
            override.returns(
              {
                state:
                  Anthropic::Beta::Organization::BetaComplianceSettings::State::Variants,
                type: Symbol
              }
            )
          end
          def to_hash
          end

          # Whether the Compliance API is enabled for this organization.
          module State
            extend Anthropic::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::BetaComplianceSettingsStateEnabled,
                  Anthropic::Beta::Organization::BetaComplianceSettingsStateDisabled
                )
              end

            module Type
              extend Anthropic::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Anthropic::Beta::Organization::BetaComplianceSettings::State::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              ENABLED =
                T.let(
                  :enabled,
                  Anthropic::Beta::Organization::BetaComplianceSettings::State::Type::TaggedSymbol
                )
              DISABLED =
                T.let(
                  :disabled,
                  Anthropic::Beta::Organization::BetaComplianceSettings::State::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Organization::BetaComplianceSettings::State::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaComplianceSettings::State::Variants
                ]
              )
            end
            def self.variants
            end

            # Creates a new instance of the variant class whose `type` matches the given
            # value, passing the remaining arguments to its constructor.
            sig do
              params(type: T.any(Symbol, String)).returns(
                Anthropic::Beta::Organization::BetaComplianceSettings::State::Variants
              )
            end
            def self.new(type:)
            end
          end
        end
      end
    end
  end
end
