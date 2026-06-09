# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsOrganizationDisabledRunError =
      Beta::BetaManagedAgentsOrganizationDisabledRunError

    module Beta
      class BetaManagedAgentsOrganizationDisabledRunError < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsOrganizationDisabledRunError,
              Anthropic::Internal::AnyHash
            )
          end

        # Human-readable error description.
        sig { returns(String) }
        attr_accessor :message

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsOrganizationDisabledRunError::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # The deployment's organization is disabled.
        sig do
          params(
            message: String,
            type:
              Anthropic::Beta::BetaManagedAgentsOrganizationDisabledRunError::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Human-readable error description.
          message:,
          type:
        )
        end

        sig do
          override.returns(
            {
              message: String,
              type:
                Anthropic::Beta::BetaManagedAgentsOrganizationDisabledRunError::Type::TaggedSymbol
            }
          )
        end
        def to_hash
        end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaManagedAgentsOrganizationDisabledRunError::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ORGANIZATION_DISABLED_ERROR =
            T.let(
              :organization_disabled_error,
              Anthropic::Beta::BetaManagedAgentsOrganizationDisabledRunError::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsOrganizationDisabledRunError::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
