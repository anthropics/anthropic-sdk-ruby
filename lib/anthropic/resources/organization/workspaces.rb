# frozen_string_literal: true

module Anthropic
  module Resources
    class Organization
      class Workspaces
        # @return [Anthropic::Resources::Organization::Workspaces::RateLimits]
        attr_reader :rate_limits

        # @return [Anthropic::Resources::Organization::Workspaces::Members]
        attr_reader :members

        # @return [Anthropic::Resources::Organization::Workspaces::ServiceAccounts]
        attr_reader :service_accounts

        # Create Workspace
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Organization::WorkspaceCreateParams} for more details.
        #
        # @overload create(name:, data_residency: nil, display_color: nil, external_key_id: nil, tags: nil, request_options: {})
        #
        # @param name [String] Name of the Workspace.
        #
        # @param data_residency [Anthropic::Models::Organization::DataResidencyCreateConfig, nil] Data residency configuration for the workspace. If omitted, defaults to `workspa
        #
        # @param display_color [String, nil] Hex color code representing the Workspace in the Anthropic Console.
        #
        # @param external_key_id [String, nil] ID of the customer-managed encryption key (CMEK) configuration to use for this
        #
        # @param tags [Hash{Symbol=>String}, nil] User-defined tags as string key-value pairs. Keys may not begin with `anthropic`
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Organization::Workspace]
        #
        # @see Anthropic::Models::Organization::WorkspaceCreateParams
        def create(params)
          parsed, options = Anthropic::Organization::WorkspaceCreateParams.dump_request(params)
          @client.request(
            method: :post,
            path: "v1/organizations/workspaces",
            body: parsed,
            model: Anthropic::Organization::Workspace,
            options: options
          )
        end

        # Get Workspace
        #
        # @overload retrieve(workspace_id, request_options: {})
        #
        # @param workspace_id [String] ID of the Workspace.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Organization::Workspace]
        #
        # @see Anthropic::Models::Organization::WorkspaceRetrieveParams
        def retrieve(workspace_id, params = {})
          @client.request(
            method: :get,
            path: ["v1/organizations/workspaces/%1$s", workspace_id],
            model: Anthropic::Organization::Workspace,
            options: params[:request_options]
          )
        end

        # Update Workspace
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Organization::WorkspaceUpdateParams} for more details.
        #
        # @overload update(workspace_id, data_residency: nil, display_color: nil, external_key_id: nil, name: nil, tags: nil, request_options: {})
        #
        # @param workspace_id [String]
        #
        # @param data_residency [Anthropic::Models::Organization::DataResidencyUpdateConfig, nil] Data residency configuration for the workspace.
        #
        # @param display_color [String] Hex color code representing the Workspace in the Anthropic Console.
        #
        # @param external_key_id [String] ID of the customer-managed encryption key (CMEK) configuration to use for this
        #
        # @param name [String] Name of the Workspace.
        #
        # @param tags [Hash{Symbol=>String, nil}, nil] User-defined tags as string key-value pairs. Keys may not begin with `anthropic`
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Organization::Workspace]
        #
        # @see Anthropic::Models::Organization::WorkspaceUpdateParams
        def update(workspace_id, params = {})
          parsed, options = Anthropic::Organization::WorkspaceUpdateParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["v1/organizations/workspaces/%1$s", workspace_id],
            body: parsed,
            model: Anthropic::Organization::Workspace,
            options: options
          )
        end

        # List Workspaces
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Organization::WorkspaceListParams} for more details.
        #
        # @overload list(after_id: nil, before_id: nil, include_archived: nil, limit: nil, request_options: {})
        #
        # @param after_id [String] ID of the object to use as a cursor for pagination. When provided, returns the p
        #
        # @param before_id [String] ID of the object to use as a cursor for pagination. When provided, returns the p
        #
        # @param include_archived [Boolean] Whether to include Workspaces that have been archived in the response
        #
        # @param limit [Integer] Number of items to return per page.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Internal::Page<Anthropic::Models::Organization::Workspace>]
        #
        # @see Anthropic::Models::Organization::WorkspaceListParams
        def list(params = {})
          parsed, options = Anthropic::Organization::WorkspaceListParams.dump_request(params)
          query = Anthropic::Internal::Util.encode_query_params(parsed)
          @client.request(
            method: :get,
            path: "v1/organizations/workspaces",
            query: query,
            page: Anthropic::Internal::Page,
            model: Anthropic::Organization::Workspace,
            options: options
          )
        end

        # Archive Workspace
        #
        # @overload archive(workspace_id, request_options: {})
        #
        # @param workspace_id [String]
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Organization::Workspace]
        #
        # @see Anthropic::Models::Organization::WorkspaceArchiveParams
        def archive(workspace_id, params = {})
          @client.request(
            method: :post,
            path: ["v1/organizations/workspaces/%1$s/archive", workspace_id],
            model: Anthropic::Organization::Workspace,
            options: params[:request_options]
          )
        end

        # @api private
        #
        # @param client [Anthropic::Client]
        def initialize(client:)
          @client = client
          @rate_limits = Anthropic::Resources::Organization::Workspaces::RateLimits.new(client: client)
          @members = Anthropic::Resources::Organization::Workspaces::Members.new(client: client)
          @service_accounts = Anthropic::Resources::Organization::Workspaces::ServiceAccounts.new(client: client)
        end
      end
    end
  end
end
