# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::Deployments#update
      class DeploymentUpdateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        # @!attribute deployment_id
        #
        #   @return [String]
        required :deployment_id, String

        # @!attribute agent
        #   Agent to deploy. Accepts the `agent` ID string, which re-pins to the latest
        #   version, or an `agent` object with both id and version specified. Omit to
        #   preserve. Cannot be cleared.
        #
        #   @return [String, Anthropic::Models::Beta::BetaManagedAgentsAgentParams, nil]
        optional :agent, union: -> { Anthropic::Beta::DeploymentUpdateParams::Agent }

        # @!attribute description
        #   Description. Omit to preserve; send empty string or null to clear.
        #
        #   @return [String, nil]
        optional :description, String, nil?: true

        # @!attribute environment_id
        #   ID of the `environment` where sessions run. Omit to preserve. Cannot be cleared.
        #
        #   @return [String, nil]
        optional :environment_id, String

        # @!attribute initial_events
        #   Initial events. Full replacement. Omit to preserve. Cannot be cleared. At least
        #   1, maximum 50.
        #
        #   @return [Array<Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserMessageEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSystemMessageEventParams>, nil]
        optional :initial_events,
                 -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaManagedAgentsDeploymentInitialEventParams] }

        # @!attribute metadata
        #   Metadata patch. Set a key to a string to upsert it, or to null to delete it.
        #   Omit the field to preserve. The stored bag is limited to 16 keys (up to 64 chars
        #   each) with values up to 512 chars.
        #
        #   @return [Hash{Symbol=>String, nil}, nil]
        optional :metadata, Anthropic::Internal::Type::HashOf[String, nil?: true], nil?: true

        # @!attribute name
        #   Human-readable name. Must be non-empty. Omit to preserve. Cannot be cleared.
        #
        #   @return [String, nil]
        optional :name, String

        # @!attribute resources
        #   Session resources. Full replacement. Omit to preserve; send empty array or null
        #   to clear. Maximum 500.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaManagedAgentsGitHubRepositoryResourceParams, Anthropic::Models::Beta::BetaManagedAgentsFileResourceParams, Anthropic::Models::Beta::BetaManagedAgentsMemoryStoreResourceParam>, nil]
        optional :resources,
                 -> {
                   Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::DeploymentUpdateParams::Resource]
                 },
                 nil?: true

        # @!attribute schedule
        #   5-field POSIX cron schedule. Literal wall-clock matching in the configured
        #   timezone.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsScheduleParams, nil]
        optional :schedule, -> { Anthropic::Beta::BetaManagedAgentsScheduleParams }, nil?: true

        # @!attribute vault_ids
        #   Vault IDs. Full replacement. Omit to preserve; send empty array or null to
        #   clear. Maximum 50.
        #
        #   @return [Array<String>, nil]
        optional :vault_ids, Anthropic::Internal::Type::ArrayOf[String], nil?: true

        # @!attribute betas
        #   Optional header to specify the beta version(s) you want to use.
        #
        #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
        optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

        # @!method initialize(deployment_id:, agent: nil, description: nil, environment_id: nil, initial_events: nil, metadata: nil, name: nil, resources: nil, schedule: nil, vault_ids: nil, betas: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::DeploymentUpdateParams} for more details.
        #
        #   @param deployment_id [String]
        #
        #   @param agent [String, Anthropic::Models::Beta::BetaManagedAgentsAgentParams] Agent to deploy. Accepts the `agent` ID string, which re-pins to the latest vers
        #
        #   @param description [String, nil] Description. Omit to preserve; send empty string or null to clear.
        #
        #   @param environment_id [String] ID of the `environment` where sessions run. Omit to preserve. Cannot be cleared.
        #
        #   @param initial_events [Array<Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserMessageEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSystemMessageEventParams>] Initial events. Full replacement. Omit to preserve. Cannot be cleared. At least
        #
        #   @param metadata [Hash{Symbol=>String, nil}, nil] Metadata patch. Set a key to a string to upsert it, or to null to delete it. Omi
        #
        #   @param name [String] Human-readable name. Must be non-empty. Omit to preserve. Cannot be cleared.
        #
        #   @param resources [Array<Anthropic::Models::Beta::BetaManagedAgentsGitHubRepositoryResourceParams, Anthropic::Models::Beta::BetaManagedAgentsFileResourceParams, Anthropic::Models::Beta::BetaManagedAgentsMemoryStoreResourceParam>, nil] Session resources. Full replacement. Omit to preserve; send empty array or null
        #
        #   @param schedule [Anthropic::Models::Beta::BetaManagedAgentsScheduleParams, nil] 5-field POSIX cron schedule. Literal wall-clock matching in the configured timez
        #
        #   @param vault_ids [Array<String>, nil] Vault IDs. Full replacement. Omit to preserve; send empty array or null to clear
        #
        #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]

        # Agent to deploy. Accepts the `agent` ID string, which re-pins to the latest
        # version, or an `agent` object with both id and version specified. Omit to
        # preserve. Cannot be cleared.
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
