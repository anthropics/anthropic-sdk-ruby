# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsWorkspaceArchivedRunError =
      Beta::BetaManagedAgentsWorkspaceArchivedRunError

    module Beta
      class BetaManagedAgentsWorkspaceArchivedRunError < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsWorkspaceArchivedRunError,
              Anthropic::Internal::AnyHash
            )
          end

        # Human-readable error description.
        sig { returns(String) }
        attr_accessor :message

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsWorkspaceArchivedRunError::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # The deployment's workspace was archived.
        sig do
          params(
            message: String,
            type:
              Anthropic::Beta::BetaManagedAgentsWorkspaceArchivedRunError::Type::OrSymbol
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
                Anthropic::Beta::BetaManagedAgentsWorkspaceArchivedRunError::Type::TaggedSymbol
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
                Anthropic::Beta::BetaManagedAgentsWorkspaceArchivedRunError::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          WORKSPACE_ARCHIVED_ERROR =
            T.let(
              :workspace_archived_error,
              Anthropic::Beta::BetaManagedAgentsWorkspaceArchivedRunError::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsWorkspaceArchivedRunError::Type::TaggedSymbol
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
