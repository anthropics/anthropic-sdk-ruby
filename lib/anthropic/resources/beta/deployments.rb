# frozen_string_literal: true

module Anthropic
  module Resources
    class Beta
      class Deployments
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::DeploymentCreateParams} for more details.
        #
        # Create Deployment
        #
        # @overload create(agent:, environment_id:, initial_events:, name:, description: nil, metadata: nil, resources: nil, schedule: nil, vault_ids: nil, betas: nil, request_options: {})
        #
        # @param agent [String, Anthropic::Models::Beta::BetaManagedAgentsAgentParams] Body param: Agent to deploy. Accepts the `agent` ID string, which pins the lates
        #
        # @param environment_id [String] Body param: ID of the `environment` defining the container configuration for ses
        #
        # @param initial_events [Array<Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserMessageEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSystemMessageEventParams>] Body param: Events to send to each session immediately after creation. At least
        #
        # @param name [String] Body param: Human-readable name for the deployment.
        #
        # @param description [String, nil] Body param: Description of what the deployment does.
        #
        # @param metadata [Hash{Symbol=>String}] Body param: Arbitrary key-value metadata. Maximum 16 pairs, keys up to 64 chars,
        #
        # @param resources [Array<Anthropic::Models::Beta::BetaManagedAgentsGitHubRepositoryResourceParams, Anthropic::Models::Beta::BetaManagedAgentsFileResourceParams, Anthropic::Models::Beta::BetaManagedAgentsMemoryStoreResourceParam>] Body param: Resources (e.g. repositories, files) to mount into each session's co
        #
        # @param schedule [Anthropic::Models::Beta::BetaManagedAgentsScheduleParams, nil] Body param: 5-field POSIX cron schedule. Literal wall-clock matching in the conf
        #
        # @param vault_ids [Array<String>] Body param: Vault IDs for stored credentials the agent can use during sessions c
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaManagedAgentsDeployment]
        #
        # @see Anthropic::Models::Beta::DeploymentCreateParams
        def create(params)
          parsed, options = Anthropic::Beta::DeploymentCreateParams.dump_request(params)
          header_params = {betas: "anthropic-beta"}
          @client.request(
            method: :post,
            path: "v1/deployments?beta=true",
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: Anthropic::Beta::BetaManagedAgentsDeployment,
            options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
          )
        end

        # Get Deployment
        #
        # @overload retrieve(deployment_id, betas: nil, request_options: {})
        #
        # @param deployment_id [String] Path parameter deployment_id
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaManagedAgentsDeployment]
        #
        # @see Anthropic::Models::Beta::DeploymentRetrieveParams
        def retrieve(deployment_id, params = {})
          parsed, options = Anthropic::Beta::DeploymentRetrieveParams.dump_request(params)
          @client.request(
            method: :get,
            path: ["v1/deployments/%1$s?beta=true", deployment_id],
            headers: parsed.transform_keys(betas: "anthropic-beta"),
            model: Anthropic::Beta::BetaManagedAgentsDeployment,
            options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
          )
        end

        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::DeploymentUpdateParams} for more details.
        #
        # Update Deployment
        #
        # @overload update(deployment_id, agent: nil, description: nil, environment_id: nil, initial_events: nil, metadata: nil, name: nil, resources: nil, schedule: nil, vault_ids: nil, betas: nil, request_options: {})
        #
        # @param deployment_id [String] Path param: Path parameter deployment_id
        #
        # @param agent [String, Anthropic::Models::Beta::BetaManagedAgentsAgentParams] Body param: Agent to deploy. Accepts the `agent` ID string, which re-pins to the
        #
        # @param description [String, nil] Body param: Description. Omit to preserve; send empty string or null to clear.
        #
        # @param environment_id [String] Body param: ID of the `environment` where sessions run. Omit to preserve. Cannot
        #
        # @param initial_events [Array<Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserMessageEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSystemMessageEventParams>] Body param: Initial events. Full replacement. Omit to preserve. Cannot be cleare
        #
        # @param metadata [Hash{Symbol=>String, nil}, nil] Body param: Metadata patch. Set a key to a string to upsert it, or to null to de
        #
        # @param name [String] Body param: Human-readable name. Must be non-empty. Omit to preserve. Cannot be
        #
        # @param resources [Array<Anthropic::Models::Beta::BetaManagedAgentsGitHubRepositoryResourceParams, Anthropic::Models::Beta::BetaManagedAgentsFileResourceParams, Anthropic::Models::Beta::BetaManagedAgentsMemoryStoreResourceParam>, nil] Body param: Session resources. Full replacement. Omit to preserve; send empty ar
        #
        # @param schedule [Anthropic::Models::Beta::BetaManagedAgentsScheduleParams, nil] Body param: 5-field POSIX cron schedule. Literal wall-clock matching in the conf
        #
        # @param vault_ids [Array<String>, nil] Body param: Vault IDs. Full replacement. Omit to preserve; send empty array or n
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaManagedAgentsDeployment]
        #
        # @see Anthropic::Models::Beta::DeploymentUpdateParams
        def update(deployment_id, params = {})
          parsed, options = Anthropic::Beta::DeploymentUpdateParams.dump_request(params)
          header_params = {betas: "anthropic-beta"}
          @client.request(
            method: :post,
            path: ["v1/deployments/%1$s?beta=true", deployment_id],
            headers: parsed.slice(*header_params.keys).transform_keys(header_params),
            body: parsed.except(*header_params.keys),
            model: Anthropic::Beta::BetaManagedAgentsDeployment,
            options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
          )
        end

        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::DeploymentListParams} for more details.
        #
        # List Deployments
        #
        # @overload list(agent_id: nil, created_at_gte: nil, created_at_lte: nil, include_archived: nil, limit: nil, page: nil, status: nil, betas: nil, request_options: {})
        #
        # @param agent_id [String] Query param: Filter by agent ID.
        #
        # @param created_at_gte [Time] Query param: Return deployments created at or after this time (inclusive).
        #
        # @param created_at_lte [Time] Query param: Return deployments created at or before this time (inclusive).
        #
        # @param include_archived [Boolean] Query param: When true, includes archived deployments. Default: false (exclude a
        #
        # @param limit [Integer] Query param: Maximum results per page. Default 20, maximum 100.
        #
        # @param page [String] Query param: Opaque pagination cursor.
        #
        # @param status [Symbol, Anthropic::Models::Beta::BetaManagedAgentsDeploymentStatus] Query param: Filter by status: active or paused. Omit for both. To include archi
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Header param: Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Internal::PageCursor<Anthropic::Models::Beta::BetaManagedAgentsDeployment>]
        #
        # @see Anthropic::Models::Beta::DeploymentListParams
        def list(params = {})
          query_params = [
            :agent_id,
            :created_at_gte,
            :created_at_lte,
            :include_archived,
            :limit,
            :page,
            :status
          ]
          parsed, options = Anthropic::Beta::DeploymentListParams.dump_request(params)
          query = Anthropic::Internal::Util.encode_query_params(parsed.slice(*query_params))
          @client.request(
            method: :get,
            path: "v1/deployments?beta=true",
            query: query.transform_keys(created_at_gte: "created_at[gte]", created_at_lte: "created_at[lte]"),
            headers: parsed.except(*query_params).transform_keys(betas: "anthropic-beta"),
            page: Anthropic::Internal::PageCursor,
            model: Anthropic::Beta::BetaManagedAgentsDeployment,
            options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
          )
        end

        # Archive Deployment
        #
        # @overload archive(deployment_id, betas: nil, request_options: {})
        #
        # @param deployment_id [String] Path parameter deployment_id
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaManagedAgentsDeployment]
        #
        # @see Anthropic::Models::Beta::DeploymentArchiveParams
        def archive(deployment_id, params = {})
          parsed, options = Anthropic::Beta::DeploymentArchiveParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["v1/deployments/%1$s/archive?beta=true", deployment_id],
            headers: parsed.transform_keys(betas: "anthropic-beta"),
            model: Anthropic::Beta::BetaManagedAgentsDeployment,
            options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
          )
        end

        # Pause Deployment
        #
        # @overload pause(deployment_id, betas: nil, request_options: {})
        #
        # @param deployment_id [String] Path parameter deployment_id
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaManagedAgentsDeployment]
        #
        # @see Anthropic::Models::Beta::DeploymentPauseParams
        def pause(deployment_id, params = {})
          parsed, options = Anthropic::Beta::DeploymentPauseParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["v1/deployments/%1$s/pause?beta=true", deployment_id],
            headers: parsed.transform_keys(betas: "anthropic-beta"),
            model: Anthropic::Beta::BetaManagedAgentsDeployment,
            options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
          )
        end

        # Run Deployment Now
        #
        # @overload run(deployment_id, betas: nil, request_options: {})
        #
        # @param deployment_id [String] Path parameter deployment_id
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaManagedAgentsDeploymentRun]
        #
        # @see Anthropic::Models::Beta::DeploymentRunParams
        def run(deployment_id, params = {})
          parsed, options = Anthropic::Beta::DeploymentRunParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["v1/deployments/%1$s/run?beta=true", deployment_id],
            headers: parsed.transform_keys(betas: "anthropic-beta"),
            model: Anthropic::Beta::BetaManagedAgentsDeploymentRun,
            options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
          )
        end

        # Unpause Deployment
        #
        # @overload unpause(deployment_id, betas: nil, request_options: {})
        #
        # @param deployment_id [String] Path parameter deployment_id
        #
        # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}, nil]
        #
        # @return [Anthropic::Models::Beta::BetaManagedAgentsDeployment]
        #
        # @see Anthropic::Models::Beta::DeploymentUnpauseParams
        def unpause(deployment_id, params = {})
          parsed, options = Anthropic::Beta::DeploymentUnpauseParams.dump_request(params)
          @client.request(
            method: :post,
            path: ["v1/deployments/%1$s/unpause?beta=true", deployment_id],
            headers: parsed.transform_keys(betas: "anthropic-beta"),
            model: Anthropic::Beta::BetaManagedAgentsDeployment,
            options: {extra_headers: {"anthropic-beta" => "managed-agents-2026-04-01"}, **options}
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
