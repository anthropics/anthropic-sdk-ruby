# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsAgentArchivedRunError =
      Beta::BetaManagedAgentsAgentArchivedRunError

    module Beta
      class BetaManagedAgentsAgentArchivedRunError < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsAgentArchivedRunError,
              Anthropic::Internal::AnyHash
            )
          end

        # Human-readable error description.
        sig { returns(String) }
        attr_accessor :message

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsAgentArchivedRunError::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # The deployment's agent was archived.
        sig do
          params(
            message: String,
            type:
              Anthropic::Beta::BetaManagedAgentsAgentArchivedRunError::Type::OrSymbol
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
                Anthropic::Beta::BetaManagedAgentsAgentArchivedRunError::Type::TaggedSymbol
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
                Anthropic::Beta::BetaManagedAgentsAgentArchivedRunError::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          AGENT_ARCHIVED_ERROR =
            T.let(
              :agent_archived_error,
              Anthropic::Beta::BetaManagedAgentsAgentArchivedRunError::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsAgentArchivedRunError::Type::TaggedSymbol
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
