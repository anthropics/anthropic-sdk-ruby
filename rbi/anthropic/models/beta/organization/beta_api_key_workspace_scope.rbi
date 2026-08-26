# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAPIKeyWorkspaceScope < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAPIKeyWorkspaceScope,
                Anthropic::Internal::AnyHash
              )
            end

          # Scope type. Always `"workspace"`: the API key belongs to one Workspace.
          sig { returns(Symbol) }
          attr_accessor :type

          # ID of the Workspace the API key belongs to. Unlike the deprecated top-level
          # `workspace_id`, this is the Workspace's real ID even for the organization's
          # default Workspace.
          sig { returns(String) }
          attr_accessor :workspace_id

          sig do
            params(workspace_id: String, type: Symbol).returns(T.attached_class)
          end
          def self.new(
            # ID of the Workspace the API key belongs to. Unlike the deprecated top-level
            # `workspace_id`, this is the Workspace's real ID even for the organization's
            # default Workspace.
            workspace_id:,
            # Scope type. Always `"workspace"`: the API key belongs to one Workspace.
            type: :workspace
          )
          end

          sig { override.returns({ type: Symbol, workspace_id: String }) }
          def to_hash
          end
        end
      end
    end
  end
end
