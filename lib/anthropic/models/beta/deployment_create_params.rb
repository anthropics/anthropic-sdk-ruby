# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::Deployments#create
      class DeploymentCreateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        # @!attribute agent
        #   Agent to deploy. Accepts the `agent` ID string, which pins the latest version,
        #   or an `agent` object with both id and version specified. The agent must exist
        #   and not be archived.
        #
        #   @return [String, Anthropic::Models::Beta::BetaManagedAgentsAgentParams]
        required :agent, union: -> { Anthropic::Beta::DeploymentCreateParams::Agent }

        # @!attribute environment_id
        #   ID of the `environment` defining the container configuration for sessions
        #   created from this deployment.
        #
        #   @return [String]
        required :environment_id, String

        # @!attribute initial_events
        #   Events to send to each session immediately after creation. At least 1,
        #   maximum 50.
        #
        #   @return [Array<Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserMessageEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSystemMessageEventParams>]
        required :initial_events,
                 -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaManagedAgentsDeploymentInitialEventParams] }

        # @!attribute name
        #   Human-readable name for the deployment.
        #
        #   @return [String]
        required :name, String

        # @!attribute description
        #   Description of what the deployment does.
        #
        #   @return [String, nil]
        optional :description, String, nil?: true

        # @!attribute metadata
        #   Arbitrary key-value metadata. Maximum 16 pairs, keys up to 64 chars, values up
        #   to 512 chars.
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :metadata, Anthropic::Internal::Type::HashOf[String]

        # @!attribute resources
        #   Resources (e.g. repositories, files) to mount into each session's container.
        #   Maximum 500.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaManagedAgentsGitHubRepositoryResourceParams, Anthropic::Models::Beta::BetaManagedAgentsFileResourceParams, Anthropic::Models::Beta::BetaManagedAgentsMemoryStoreResourceParam>, nil]
        optional :resources,
                 -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::DeploymentCreateParams::Resource] }

        # @!attribute schedule
        #   5-field POSIX cron schedule. Literal wall-clock matching in the configured
        #   timezone.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsScheduleParams, nil]
        optional :schedule, -> { Anthropic::Beta::BetaManagedAgentsScheduleParams }, nil?: true

        # @!attribute vault_ids
        #   Vault IDs for stored credentials the agent can use during sessions created from
        #   this deployment. Maximum 50.
        #
        #   @return [Array<String>, nil]
        optional :vault_ids, Anthropic::Internal::Type::ArrayOf[String]

        # @!attribute betas
        #   Optional header to specify the beta version(s) you want to use.
        #
        #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
        optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

        # @!method initialize(agent:, environment_id:, initial_events:, name:, description: nil, metadata: nil, resources: nil, schedule: nil, vault_ids: nil, betas: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::DeploymentCreateParams} for more details.
        #
        #   @param agent [String, Anthropic::Models::Beta::BetaManagedAgentsAgentParams] Agent to deploy. Accepts the `agent` ID string, which pins the latest version, o
        #
        #   @param environment_id [String] ID of the `environment` defining the container configuration for sessions create
        #
        #   @param initial_events [Array<Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserMessageEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSystemMessageEventParams>] Events to send to each session immediately after creation. At least 1, maximum 5
        #
        #   @param name [String] Human-readable name for the deployment.
        #
        #   @param description [String, nil] Description of what the deployment does.
        #
        #   @param metadata [Hash{Symbol=>String}] Arbitrary key-value metadata. Maximum 16 pairs, keys up to 64 chars, values up t
        #
        #   @param resources [Array<Anthropic::Models::Beta::BetaManagedAgentsGitHubRepositoryResourceParams, Anthropic::Models::Beta::BetaManagedAgentsFileResourceParams, Anthropic::Models::Beta::BetaManagedAgentsMemoryStoreResourceParam>] Resources (e.g. repositories, files) to mount into each session's container. Max
        #
        #   @param schedule [Anthropic::Models::Beta::BetaManagedAgentsScheduleParams, nil] 5-field POSIX cron schedule. Literal wall-clock matching in the configured timez
        #
        #   @param vault_ids [Array<String>] Vault IDs for stored credentials the agent can use during sessions created from
        #
        #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]

        # Agent to deploy. Accepts the `agent` ID string, which pins the latest version,
        # or an `agent` object with both id and version specified. The agent must exist
        # and not be archived.
        module Agent
          extend Anthropic::Internal::Type::Union

          variant String

          # Specification for an Agent. Provide a specific `version` or use the short-form `agent="agent_id"` for the most recent version
          variant -> { Anthropic::Beta::BetaManagedAgentsAgentParams }

          # @!method self.variants
          #   @return [Array(String, Anthropic::Models::Beta::BetaManagedAgentsAgentParams)]
        end

        # Union of resources that can be mounted into a session.
        module Resource
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # Mount a GitHub repository into the session's container.
          variant :github_repository, -> { Anthropic::Beta::BetaManagedAgentsGitHubRepositoryResourceParams }

          # Mount a file uploaded via the Files API into the session.
          variant :file, -> { Anthropic::Beta::BetaManagedAgentsFileResourceParams }

          # Parameters for attaching a memory store to an agent session.
          variant :memory_store, -> { Anthropic::Beta::BetaManagedAgentsMemoryStoreResourceParam }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaManagedAgentsGitHubRepositoryResourceParams, Anthropic::Models::Beta::BetaManagedAgentsFileResourceParams, Anthropic::Models::Beta::BetaManagedAgentsMemoryStoreResourceParam)]
        end
      end
    end
  end
end
