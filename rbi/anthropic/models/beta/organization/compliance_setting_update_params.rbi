# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class ComplianceSettingUpdateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::ComplianceSettingUpdateParams,
                Anthropic::Internal::AnyHash
              )
            end

          # Desired state. Accepts the string shorthand "enabled" or "disabled" in place of
          # the object form; the response always returns the canonical object form.
          sig do
            returns(
              T.any(
                Anthropic::Beta::Organization::BetaComplianceSettingsStateEnabledParam,
                Anthropic::Beta::Organization::BetaComplianceSettingsStateDisabledParam
              )
            )
          end
          attr_accessor :state

          sig do
            params(
              state:
                T.any(
                  Anthropic::Beta::Organization::BetaComplianceSettingsStateEnabledParam::OrHash,
                  Anthropic::Beta::Organization::BetaComplianceSettingsStateDisabledParam::OrHash
                ),
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Desired state. Accepts the string shorthand "enabled" or "disabled" in place of
            # the object form; the response always returns the canonical object form.
            state:,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                state:
                  T.any(
                    Anthropic::Beta::Organization::BetaComplianceSettingsStateEnabledParam,
                    Anthropic::Beta::Organization::BetaComplianceSettingsStateDisabledParam
                  ),
                request_options: Anthropic::RequestOptions
              }
            )
          end
          def to_hash
          end

          # Desired state. Accepts the string shorthand "enabled" or "disabled" in place of
          # the object form; the response always returns the canonical object form.
          module State
            extend Anthropic::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::BetaComplianceSettingsStateEnabledParam,
                  Anthropic::Beta::Organization::BetaComplianceSettingsStateDisabledParam
                )
              end

            module Type
              extend Anthropic::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Anthropic::Beta::Organization::ComplianceSettingUpdateParams::State::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              ENABLED =
                T.let(
                  :enabled,
                  Anthropic::Beta::Organization::ComplianceSettingUpdateParams::State::Type::TaggedSymbol
                )
              DISABLED =
                T.let(
                  :disabled,
                  Anthropic::Beta::Organization::ComplianceSettingUpdateParams::State::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Organization::ComplianceSettingUpdateParams::State::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::ComplianceSettingUpdateParams::State::Variants
                ]
              )
            end
            def self.variants
            end

            # Creates a new instance of the variant class whose `type` matches the given
            # value, passing the remaining arguments to its constructor.
            sig do
              params(type: T.any(Symbol, String)).returns(
                Anthropic::Beta::Organization::ComplianceSettingUpdateParams::State::Variants
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
