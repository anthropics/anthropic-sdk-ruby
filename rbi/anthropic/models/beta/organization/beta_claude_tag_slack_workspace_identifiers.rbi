# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaClaudeTagSlackWorkspaceIdentifiers < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaClaudeTagSlackWorkspaceIdentifiers,
                Anthropic::Internal::AnyHash
              )
            end

          # Slack's identifier for the workspace, starting with `T`, such as `T0123ABCD`.
          sig { returns(String) }
          attr_accessor :workspace_id

          # The identifier Slack shows for a workspace. It is Slack's own, not an identifier
          # of this API.
          sig { params(workspace_id: String).returns(T.attached_class) }
          def self.new(
            # Slack's identifier for the workspace, starting with `T`, such as `T0123ABCD`.
            workspace_id:
          )
          end

          sig { override.returns({ workspace_id: String }) }
          def to_hash
          end
        end
      end
    end
  end
end
