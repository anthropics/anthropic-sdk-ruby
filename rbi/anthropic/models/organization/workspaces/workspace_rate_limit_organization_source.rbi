# typed: strong

module Anthropic
  module Models
    module Organization
      WorkspaceRateLimitOrganizationSource =
        Workspaces::WorkspaceRateLimitOrganizationSource

      module Workspaces
        class WorkspaceRateLimitOrganizationSource < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Organization::Workspaces::WorkspaceRateLimitOrganizationSource,
                Anthropic::Internal::AnyHash
              )
            end

          # Always `organization`: no workspace-level override is stored, so the
          # organization's value applies.
          sig { returns(Symbol) }
          attr_accessor :type

          sig { params(type: Symbol).returns(T.attached_class) }
          def self.new(
            # Always `organization`: no workspace-level override is stored, so the
            # organization's value applies.
            type: :organization
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
