# typed: strong

module Anthropic
  module Models
    module Organization
      module ComplianceSettingsStateParam
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Organization::ComplianceSettingsStateEnabledParam,
              Anthropic::Organization::ComplianceSettingsStateDisabledParam
            )
          end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Organization::ComplianceSettingsStateParam::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ENABLED =
            T.let(
              :enabled,
              Anthropic::Organization::ComplianceSettingsStateParam::Type::TaggedSymbol
            )
          DISABLED =
            T.let(
              :disabled,
              Anthropic::Organization::ComplianceSettingsStateParam::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Organization::ComplianceSettingsStateParam::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        sig do
          override.returns(
            T::Array[
              Anthropic::Organization::ComplianceSettingsStateParam::Variants
            ]
          )
        end
        def self.variants
        end

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        sig do
          params(
            type:
              Anthropic::Organization::ComplianceSettingsStateParam::Type::OrSymbol
          ).returns(
            Anthropic::Organization::ComplianceSettingsStateParam::Variants
          )
        end
        def self.new(type:)
        end
      end
    end
  end
end
