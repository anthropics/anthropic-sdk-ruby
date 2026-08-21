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

        # @!attribute budget
        #   A hard spend ceiling. The session stops issuing new model requests once the
        #   tracked list cost reaches `max_list_cost`.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsBudgetLimit, nil]
        optional :budget, -> { Anthropic::Beta::BetaManagedAgentsBudgetLimit }, nil?: true

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

        # @!method initialize(agent:, environment_id:, initial_events:, name:, budget: nil, description: nil, metadata: nil, resources: nil, schedule: nil, vault_ids: nil, betas: nil, request_options: {})
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
        #   @param budget [Anthropic::Models::Beta::BetaManagedAgentsBudgetLimit, nil] A hard spend ceiling. The session stops issuing new model requests once the trac
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

          module Type
            extend Anthropic::Internal::Type::Enum

            GITHUB_REPOSITORY = :github_repository
            FILE = :file
            MEMORY_STORE = :memory_store

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaManagedAgentsGitHubRepositoryResourceParams, Anthropic::Models::Beta::BetaManagedAgentsFileResourceParams, Anthropic::Models::Beta::BetaManagedAgentsMemoryStoreResourceParam)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::DeploymentCreateParams::Resource} for more details.
          #
          # @param type [Symbol, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [String] :authorization_token GitHub authorization token used to clone the repository.
          #
          #   @option args [String] :url Github URL of the repository
          #
          #   @option args [Anthropic::Models::Beta::BetaManagedAgentsBranchCheckout, Anthropic::Models::Beta::BetaManagedAgentsCommitCheckout, nil] :checkout Branch or commit to check out. Defaults to the repository's default branch.
          #
          #   @option args [String, nil] :mount_path Mount path in the container. Defaults to `/workspace/<repo-name>`.
          #
          #   @option args [String] :file_id ID of a previously uploaded file.
          #
          #   @option args [String] :memory_store_id The memory store ID (memstore\_...). Must belong to the caller's organization
          #   and
          #
          #   @option args [Symbol, Anthropic::Models::Beta::BetaManagedAgentsMemoryStoreResourceParam::Access, nil] :access Access mode for an attached memory store.
          #
          #   @option args [String, nil] :instructions Per-attachment guidance for the agent on how to use this store. Rendered into th
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::BetaManagedAgentsGitHubRepositoryResourceParams, Anthropic::Models::Beta::BetaManagedAgentsFileResourceParams, Anthropic::Models::Beta::BetaManagedAgentsMemoryStoreResourceParam]
          def self.new(type:, **args)
            case type.to_sym
            when :github_repository
              Anthropic::Beta::BetaManagedAgentsGitHubRepositoryResourceParams.new(**args)
            when :file
              Anthropic::Beta::BetaManagedAgentsFileResourceParams.new(**args)
            when :memory_store
              Anthropic::Beta::BetaManagedAgentsMemoryStoreResourceParam.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end
      end
    end
  end
end
