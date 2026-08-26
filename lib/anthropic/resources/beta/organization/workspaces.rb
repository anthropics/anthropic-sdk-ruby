# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Organization
        class Workspaces
          # @return [Anthropic::Resources::Beta::Organization::Workspaces::RateLimits]
          attr_reader :rate_limits

          # @return [Anthropic::Resources::Beta::Organization::Workspaces::Members]
          attr_reader :members

          # @return [Anthropic::Resources::Beta::Organization::Workspaces::ServiceAccounts]
          attr_reader :service_accounts

          # Create Workspace
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Organization::WorkspaceCreateParams} for more details.
          #
          # @overload create(name:, data_residency: nil, display_color: nil, external_key_id: nil, tags: nil, betas: nil, request_options: {})
          #
          # @param name [String] Body param: Name of the Workspace.
          #
          # @param data_residency [Anthropic::Models::Beta::Organization::BetaDataResidencyCreateConfig, nil] Body param: Data residency configuration for the workspace. If omitted, defaults
          #
          # @param display_color [String, nil] Body param: Hex color code representing the Workspace in the Anthropic Console.
          #
          # @param external_key_id [String, nil] Body param: ID of the customer-managed encryption key (CMEK) configuration to us
          #
          # @param tags [Hash{Symbol=>String}, nil] Body param: User-defined tags as string key-value pairs. Keys may not begin with
          #
          # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
          #
          # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
          #
          # @return [Anthropic::Models::Beta::Organization::BetaWorkspace]
          #
          # @see Anthropic::Models::Beta::Organization::WorkspaceCreateParams
          def create(params)
            parsed, options = Anthropic::Beta::Organization::WorkspaceCreateParams.dump_request(params)
            header_params = {betas: "anthropic-beta"}
            @client.request(
              method: :post,
              path: "v1/organizations/workspaces?beta=true",
              headers: parsed.slice(*header_params.keys).transform_keys(header_params),
              body: parsed.except(*header_params.keys),
              model: Anthropic::Beta::Organization::BetaWorkspace,
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
          # @return [Anthropic::Models::Beta::Organization::BetaWorkspace]
          #
          # @see Anthropic::Models::Beta::Organization::WorkspaceRetrieveParams
          def retrieve(workspace_id, params = {})
            @client.request(
              method: :get,
              path: ["v1/organizations/workspaces/%1$s?beta=true", workspace_id],
              model: Anthropic::Beta::Organization::BetaWorkspace,
              options: params[:request_options]
            )
          end

          # Update Workspace
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Organization::WorkspaceUpdateParams} for more details.
          #
          # @overload update(workspace_id, data_residency: nil, display_color: nil, external_key_id: nil, name: nil, tags: nil, request_options: {})
          #
          # @param workspace_id [String]
          #
          # @param data_residency [Anthropic::Models::Beta::Organization::BetaDataResidencyUpdateConfig, nil] Data residency configuration for the workspace.
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
          # @return [Anthropic::Models::Beta::Organization::BetaWorkspace]
          #
          # @see Anthropic::Models::Beta::Organization::WorkspaceUpdateParams
          def update(workspace_id, params = {})
            parsed, options = Anthropic::Beta::Organization::WorkspaceUpdateParams.dump_request(params)
            @client.request(
              method: :post,
              path: ["v1/organizations/workspaces/%1$s?beta=true", workspace_id],
              body: parsed,
              model: Anthropic::Beta::Organization::BetaWorkspace,
              options: options
            )
          end

          # List Workspaces
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Organization::WorkspaceListParams} for more details.
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
          # @return [Anthropic::Internal::Page<Anthropic::Models::Beta::Organization::BetaWorkspace>]
          #
          # @see Anthropic::Models::Beta::Organization::WorkspaceListParams
          def list(params = {})
            parsed, options = Anthropic::Beta::Organization::WorkspaceListParams.dump_request(params)
            query = Anthropic::Internal::Util.encode_query_params(parsed)
            @client.request(
              method: :get,
              path: "v1/organizations/workspaces?beta=true",
              query: query,
              page: Anthropic::Internal::Page,
              model: Anthropic::Beta::Organization::BetaWorkspace,
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
          # @return [Anthropic::Models::Beta::Organization::BetaWorkspace]
          #
          # @see Anthropic::Models::Beta::Organization::WorkspaceArchiveParams
          def archive(workspace_id, params = {})
            @client.request(
              method: :post,
              path: ["v1/organizations/workspaces/%1$s/archive?beta=true", workspace_id],
              model: Anthropic::Beta::Organization::BetaWorkspace,
              options: params[:request_options]
            )
          end

          # @api private
          #
          # @param client [Anthropic::Client]
          def initialize(client:)
            @client = client
            @rate_limits = Anthropic::Resources::Beta::Organization::Workspaces::RateLimits.new(client: client)
            @members = Anthropic::Resources::Beta::Organization::Workspaces::Members.new(client: client)
            @service_accounts =
              Anthropic::Resources::Beta::Organization::Workspaces::ServiceAccounts.new(client: client)
          end
        end
      end
    end
  end
end
