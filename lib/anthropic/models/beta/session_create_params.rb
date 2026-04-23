# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::Sessions#create
      class SessionCreateParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        # @!attribute agent
        #   Agent identifier. Accepts the `agent` ID string, which pins the latest version
        #   for the session, or an `agent` object with both id and version specified.
        #
        #   @return [String, Anthropic::Models::Beta::BetaManagedAgentsAgentParams]
        required :agent, union: -> { Anthropic::Beta::SessionCreateParams::Agent }

        # @!attribute environment_id
        #   ID of the `environment` defining the container configuration for this session.
        #
        #   @return [String]
        required :environment_id, String

        # @!attribute metadata
        #   Arbitrary key-value metadata attached to the session. Maximum 16 pairs, keys up
        #   to 64 chars, values up to 512 chars.
        #
        #   @return [Hash{Symbol=>String}, nil]
        optional :metadata, Anthropic::Internal::Type::HashOf[String]

        # @!attribute resources
        #   Resources (e.g. repositories, files) to mount into the session's container.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaManagedAgentsGitHubRepositoryResourceParams, Anthropic::Models::Beta::BetaManagedAgentsFileResourceParams, Anthropic::Models::Beta::BetaManagedAgentsMemoryStoreResourceParam>, nil]
        optional :resources,
                 -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::SessionCreateParams::Resource] }

        # @!attribute title
        #   Human-readable session title.
        #
        #   @return [String, nil]
        optional :title, String, nil?: true

        # @!attribute vault_ids
        #   Vault IDs for stored credentials the agent can use during the session.
        #
        #   @return [Array<String>, nil]
        optional :vault_ids, Anthropic::Internal::Type::ArrayOf[String]

        # @!attribute betas
        #   Optional header to specify the beta version(s) you want to use.
        #
        #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
        optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

        # @!method initialize(agent:, environment_id:, metadata: nil, resources: nil, title: nil, vault_ids: nil, betas: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::SessionCreateParams} for more details.
        #
        #   @param agent [String, Anthropic::Models::Beta::BetaManagedAgentsAgentParams] Agent identifier. Accepts the `agent` ID string, which pins the latest version f
        #
        #   @param environment_id [String] ID of the `environment` defining the container configuration for this session.
        #
        #   @param metadata [Hash{Symbol=>String}] Arbitrary key-value metadata attached to the session. Maximum 16 pairs, keys up
        #
        #   @param resources [Array<Anthropic::Models::Beta::BetaManagedAgentsGitHubRepositoryResourceParams, Anthropic::Models::Beta::BetaManagedAgentsFileResourceParams, Anthropic::Models::Beta::BetaManagedAgentsMemoryStoreResourceParam>] Resources (e.g. repositories, files) to mount into the session's container.
        #
        #   @param title [String, nil] Human-readable session title.
        #
        #   @param vault_ids [Array<String>] Vault IDs for stored credentials the agent can use during the session.
        #
        #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]

        # Agent identifier. Accepts the `agent` ID string, which pins the latest version
        # for the session, or an `agent` object with both id and version specified.
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
