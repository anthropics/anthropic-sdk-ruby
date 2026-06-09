# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsEnvironmentArchivedRunError =
      Beta::BetaManagedAgentsEnvironmentArchivedRunError

    module Beta
      class BetaManagedAgentsEnvironmentArchivedRunError < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsEnvironmentArchivedRunError,
              Anthropic::Internal::AnyHash
            )
          end

        # Human-readable error description.
        sig { returns(String) }
        attr_accessor :message

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsEnvironmentArchivedRunError::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # The deployment's environment was archived.
        sig do
          params(
            message: String,
            type:
              Anthropic::Beta::BetaManagedAgentsEnvironmentArchivedRunError::Type::OrSymbol
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
                Anthropic::Beta::BetaManagedAgentsEnvironmentArchivedRunError::Type::TaggedSymbol
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
                Anthropic::Beta::BetaManagedAgentsEnvironmentArchivedRunError::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ENVIRONMENT_ARCHIVED_ERROR =
            T.let(
              :environment_archived_error,
              Anthropic::Beta::BetaManagedAgentsEnvironmentArchivedRunError::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsEnvironmentArchivedRunError::Type::TaggedSymbol
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
