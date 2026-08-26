# typed: strong

module Anthropic
  module Resources
    class Beta
      class Organization
        class Workspaces
          class Members
            # Get Workspace Member
            sig do
              params(
                user_id: String,
                workspace_id: String,
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(Anthropic::Beta::Organization::BetaWorkspaceMember)
            end
            def retrieve(
              # ID of the User.
              user_id,
              # ID of the Workspace.
              workspace_id:,
              request_options: {}
            )
            end

            # Update Workspace Member
            sig do
              params(
                user_id: String,
                workspace_id: String,
                workspace_role:
                  Anthropic::Beta::Organization::BetaWorkspaceRole::OrSymbol,
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(Anthropic::Beta::Organization::BetaWorkspaceMember)
            end
            def update(
              # Path param: ID of the User.
              user_id,
              # Path param: ID of the Workspace.
              workspace_id:,
              # Body param: New workspace role for the User.
              workspace_role:,
              request_options: {}
            )
            end

            # List Workspace Members
            sig do
              params(
                workspace_id: String,
                after_id: String,
                before_id: String,
                limit: Integer,
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Internal::Page[
                  Anthropic::Beta::Organization::BetaWorkspaceMember
                ]
              )
            end
            def list(
              # ID of the Workspace.
              workspace_id,
              # ID of the object to use as a cursor for pagination. When provided, returns the
              # page of results immediately after this object.
              after_id: nil,
              # ID of the object to use as a cursor for pagination. When provided, returns the
              # page of results immediately before this object.
              before_id: nil,
              # Number of items to return per page.
              #
              # Defaults to `20`. Ranges from `1` to `1000`.
              limit: nil,
              request_options: {}
            )
            end

            # Create Workspace Member
            sig do
              params(
                workspace_id: String,
                user_id: String,
                workspace_role:
                  Anthropic::Beta::Organization::BetaNoBillingWorkspaceRole::OrSymbol,
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(Anthropic::Beta::Organization::BetaWorkspaceMember)
            end
            def add(
              # ID of the Workspace.
              workspace_id,
              # ID of the User.
              user_id:,
              # Role of the new Workspace Member. Cannot be `workspace_billing`.
              workspace_role:,
              request_options: {}
            )
            end

            # Delete Workspace Member
            sig do
              params(
                user_id: String,
                workspace_id: String,
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(
                Anthropic::Models::Beta::Organization::Workspaces::MemberRemoveResponse
              )
            end
            def remove(
              # ID of the User.
              user_id,
              # ID of the Workspace.
              workspace_id:,
              request_options: {}
            )
            end

            # @api private
            sig { params(client: Anthropic::Client).returns(T.attached_class) }
            def self.new(client:)
            end
          end
        end
      end
    end
  end
end
