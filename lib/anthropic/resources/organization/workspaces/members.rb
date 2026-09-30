# frozen_string_literal: true

module Anthropic
  module Resources
    class Organization
      class Workspaces
        class Members
          # Get Workspace Member
          #
          # @overload retrieve(user_id, workspace_id:, request_options: {})
          #
          # @param user_id [String] ID of the User.
          #
          # @param workspace_id [String] ID of the Workspace.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Organization::WorkspaceMember]
          #
          # @see Anthropic::Models::Organization::Workspaces::MemberRetrieveParams
          def retrieve(user_id, params)
            parsed, options = Anthropic::Organization::Workspaces::MemberRetrieveParams.dump_request(params)
            workspace_id =
              parsed.delete(:workspace_id) do
                raise ArgumentError.new("missing required path argument #{_1}")
              end
            @client.request(
              method: :get,
              path: ["v1/organizations/workspaces/%1$s/members/%2$s", workspace_id, user_id],
              model: Anthropic::Organization::WorkspaceMember,
              options: options
            )
          end

          # Update Workspace Member
          #
          # @overload update(user_id, workspace_id:, workspace_role:, request_options: {})
          #
          # @param user_id [String] Path param: ID of the User.
          #
          # @param workspace_id [String] Path param: ID of the Workspace.
          #
          # @param workspace_role [Symbol, Anthropic::Models::Organization::WorkspaceRole] Body param: New workspace role for the User.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Organization::WorkspaceMember]
          #
          # @see Anthropic::Models::Organization::Workspaces::MemberUpdateParams
          def update(user_id, params)
            parsed, options = Anthropic::Organization::Workspaces::MemberUpdateParams.dump_request(params)
            workspace_id =
              parsed.delete(:workspace_id) do
                raise ArgumentError.new("missing required path argument #{_1}")
              end
            @client.request(
              method: :post,
              path: ["v1/organizations/workspaces/%1$s/members/%2$s", workspace_id, user_id],
              body: parsed,
              model: Anthropic::Organization::WorkspaceMember,
              options: options
            )
          end

          # List Workspace Members
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Organization::Workspaces::MemberListParams} for more
          # details.
          #
          # @overload list(workspace_id, after_id: nil, before_id: nil, limit: nil, request_options: {})
          #
          # @param workspace_id [String] ID of the Workspace.
          #
          # @param after_id [String] ID of the object to use as a cursor for pagination. When provided, returns the p
          #
          # @param before_id [String] ID of the object to use as a cursor for pagination. When provided, returns the p
          #
          # @param limit [Integer] Number of items to return per page.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Internal::Page<Anthropic::Models::Organization::WorkspaceMember>]
          #
          # @see Anthropic::Models::Organization::Workspaces::MemberListParams
          def list(workspace_id, params = {})
            parsed, options = Anthropic::Organization::Workspaces::MemberListParams.dump_request(params)
            query = Anthropic::Internal::Util.encode_query_params(parsed)
            @client.request(
              method: :get,
              path: ["v1/organizations/workspaces/%1$s/members", workspace_id],
              query: query,
              page: Anthropic::Internal::Page,
              model: Anthropic::Organization::WorkspaceMember,
              options: options
            )
          end

          # Create Workspace Member
          #
          # @overload add(workspace_id, user_id:, workspace_role:, request_options: {})
          #
          # @param workspace_id [String] ID of the Workspace.
          #
          # @param user_id [String] ID of the User.
          #
          # @param workspace_role [Symbol, Anthropic::Models::Organization::NoBillingWorkspaceRole] Role of the new Workspace Member. Cannot be `workspace_billing`.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Organization::WorkspaceMember]
          #
          # @see Anthropic::Models::Organization::Workspaces::MemberAddParams
          def add(workspace_id, params)
            parsed, options = Anthropic::Organization::Workspaces::MemberAddParams.dump_request(params)
            @client.request(
              method: :post,
              path: ["v1/organizations/workspaces/%1$s/members", workspace_id],
              body: parsed,
              model: Anthropic::Organization::WorkspaceMember,
              options: options
            )
          end

          # Delete Workspace Member
          #
          # @overload remove(user_id, workspace_id:, request_options: {})
          #
          # @param user_id [String] ID of the User.
          #
          # @param workspace_id [String] ID of the Workspace.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Organization::Workspaces::MemberRemoveResponse]
          #
          # @see Anthropic::Models::Organization::Workspaces::MemberRemoveParams
          def remove(user_id, params)
            parsed, options = Anthropic::Organization::Workspaces::MemberRemoveParams.dump_request(params)
            workspace_id =
              parsed.delete(:workspace_id) do
                raise ArgumentError.new("missing required path argument #{_1}")
              end
            @client.request(
              method: :delete,
              path: ["v1/organizations/workspaces/%1$s/members/%2$s", workspace_id, user_id],
              model: Anthropic::Models::Organization::Workspaces::MemberRemoveResponse,
              options: options
            )
          end

          # @api private
          #
          # @param client [Anthropic::Client]
          def initialize(client:)
            @client = client
          end
        end
      end
    end
  end
end
