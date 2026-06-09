# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsEnvironmentNotFoundRunError =
      Beta::BetaManagedAgentsEnvironmentNotFoundRunError

    module Beta
      class BetaManagedAgentsEnvironmentNotFoundRunError < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsEnvironmentNotFoundRunError,
              Anthropic::Internal::AnyHash
            )
          end

        # Human-readable error description.
        sig { returns(String) }
        attr_accessor :message

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsEnvironmentNotFoundRunError::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # The deployment's environment no longer exists.
        sig do
          params(
            message: String,
            type:
              Anthropic::Beta::BetaManagedAgentsEnvironmentNotFoundRunError::Type::OrSymbol
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
                Anthropic::Beta::BetaManagedAgentsEnvironmentNotFoundRunError::Type::TaggedSymbol
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
                Anthropic::Beta::BetaManagedAgentsEnvironmentNotFoundRunError::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ENVIRONMENT_NOT_FOUND_ERROR =
            T.let(
              :environment_not_found_error,
              Anthropic::Beta::BetaManagedAgentsEnvironmentNotFoundRunError::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsEnvironmentNotFoundRunError::Type::TaggedSymbol
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
