# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaWorkspaceChangedConcurrentlyErrorDetails < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaWorkspaceChangedConcurrentlyErrorDetails,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :error_code

          # The request field whose change was refused. Other values may be returned. The
          # value is a name with no data of its own.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaWorkspaceChangedConcurrentlyField::TaggedSymbol
            )
          end
          attr_accessor :field

          # Another request changed the Workspace, so this request left the setting named in
          # `field` as it is. The error's `message` says which of this request's other
          # changes are in place. Read the Workspace and send the request again if you still
          # want the change.
          sig do
            params(
              field:
                Anthropic::Beta::Organization::BetaWorkspaceChangedConcurrentlyField::OrSymbol,
              error_code: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # The request field whose change was refused. Other values may be returned. The
            # value is a name with no data of its own.
            field:,
            error_code: :workspace_changed_concurrently
          )
          end

          sig do
            override.returns(
              {
                error_code: Symbol,
                field:
                  Anthropic::Beta::Organization::BetaWorkspaceChangedConcurrentlyField::TaggedSymbol
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
