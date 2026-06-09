# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsUnknownRunError = Beta::BetaManagedAgentsUnknownRunError

    module Beta
      class BetaManagedAgentsUnknownRunError < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsUnknownRunError,
              Anthropic::Internal::AnyHash
            )
          end

        # Human-readable error description.
        sig { returns(String) }
        attr_accessor :message

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsUnknownRunError::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # An unknown or unexpected error caused the run to fail. A fallback variant;
        # clients that do not recognize a new error type can match on message alone.
        sig do
          params(
            message: String,
            type:
              Anthropic::Beta::BetaManagedAgentsUnknownRunError::Type::OrSymbol
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
                Anthropic::Beta::BetaManagedAgentsUnknownRunError::Type::TaggedSymbol
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
                Anthropic::Beta::BetaManagedAgentsUnknownRunError::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          UNKNOWN_ERROR =
            T.let(
              :unknown_error,
              Anthropic::Beta::BetaManagedAgentsUnknownRunError::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsUnknownRunError::Type::TaggedSymbol
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
