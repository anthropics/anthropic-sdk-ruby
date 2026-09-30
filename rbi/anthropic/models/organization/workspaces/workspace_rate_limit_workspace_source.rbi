# typed: strong

module Anthropic
  module Models
    module Organization
      WorkspaceRateLimitWorkspaceSource =
        Workspaces::WorkspaceRateLimitWorkspaceSource

      module Workspaces
        class WorkspaceRateLimitWorkspaceSource < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Organization::Workspaces::WorkspaceRateLimitWorkspaceSource,
                Anthropic::Internal::AnyHash
              )
            end

          # Always `workspace`: a workspace-level override is stored.
          sig { returns(Symbol) }
          attr_accessor :type

          sig { params(type: Symbol).returns(T.attached_class) }
          def self.new(
            # Always `workspace`: a workspace-level override is stored.
            type: :workspace
          )
          end

          sig { override.returns({ type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
