# typed: strong

module Anthropic
  module Models
    module Organization
      class WorkspaceCreatedIncompleteErrorDetails < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::WorkspaceCreatedIncompleteErrorDetails,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :error_code

        # ID of the Workspace the request created.
        sig { returns(String) }
        attr_accessor :workspace_id

        # The Workspace was created, but some of what the request asked for did not take
        # effect, or may not have. Don't send the create again. The error's `message` says
        # what to do with the Workspace at `workspace_id`.
        sig do
          params(workspace_id: String, error_code: Symbol).returns(
            T.attached_class
          )
        end
        def self.new(
          # ID of the Workspace the request created.
          workspace_id:,
          error_code: :workspace_created_incomplete
        )
        end

        sig { override.returns({ error_code: Symbol, workspace_id: String }) }
        def to_hash
        end
      end
    end
  end
end
