# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsDeletedSession = Beta::BetaManagedAgentsDeletedSession

    module Beta
      class BetaManagedAgentsDeletedSession < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsDeletedSession,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :id

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsDeletedSession::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # Confirmation that a `session` has been permanently deleted.
        sig do
          params(
            id: String,
            type:
              Anthropic::Beta::BetaManagedAgentsDeletedSession::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(id:, type:)
        end

        sig do
          override.returns(
            {
              id: String,
              type:
                Anthropic::Beta::BetaManagedAgentsDeletedSession::Type::TaggedSymbol
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
                Anthropic::Beta::BetaManagedAgentsDeletedSession::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SESSION_DELETED =
            T.let(
              :session_deleted,
              Anthropic::Beta::BetaManagedAgentsDeletedSession::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsDeletedSession::Type::TaggedSymbol
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
