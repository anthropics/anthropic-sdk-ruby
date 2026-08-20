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
        #   @return [String, Anthropic::Models::Beta::BetaManagedAgentsAgentParams, Anthropic::Models::Beta::BetaManagedAgentsAgentWithOverridesParams]
        required :agent, union: -> { Anthropic::Beta::SessionCreateParams::Agent }

        # @!attribute environment_id
        #   ID of the `environment` defining the container configuration for this session.
        #
        #   @return [String]
        required :environment_id, String

        # @!attribute budget
        #   A hard spend ceiling. The session stops issuing new model requests once the
        #   tracked list cost reaches `max_list_cost`.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsBudgetLimit, nil]
        optional :budget, -> { Anthropic::Beta::BetaManagedAgentsBudgetLimit }

        # @!attribute initial_events
        #   Initial events to send to the `session` at creation, processed in order.
        #   Supports `user.message` and `user.define_outcome` events. Maximum 50 events.
        #
        #   @return [Array<Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserMessageEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams>, nil]
        optional :initial_events,
                 -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::SessionCreateParams::InitialEvent] }

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

        # @!method initialize(agent:, environment_id:, budget: nil, initial_events: nil, metadata: nil, resources: nil, title: nil, vault_ids: nil, betas: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::SessionCreateParams} for more details.
        #
        #   @param agent [String, Anthropic::Models::Beta::BetaManagedAgentsAgentParams, Anthropic::Models::Beta::BetaManagedAgentsAgentWithOverridesParams] Agent identifier. Accepts the `agent` ID string, which pins the latest version f
        #
        #   @param environment_id [String] ID of the `environment` defining the container configuration for this session.
        #
        #   @param budget [Anthropic::Models::Beta::BetaManagedAgentsBudgetLimit] A hard spend ceiling. The session stops issuing new model requests once the trac
        #
        #   @param initial_events [Array<Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserMessageEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams>] Initial events to send to the `session` at creation, processed in order. Support
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

          # Reference to an `agent` plus optional configuration overrides. Each provided field replaces the agent's value for the caller's use; the agent resource is unchanged.
          variant -> { Anthropic::Beta::BetaManagedAgentsAgentWithOverridesParams }

          # @!method self.variants
          #   @return [Array(String, Anthropic::Models::Beta::BetaManagedAgentsAgentParams, Anthropic::Models::Beta::BetaManagedAgentsAgentWithOverridesParams)]
        end

        # An event sent to the `session` immediately after it is created. Supports
        # `user.message` and `user.define_outcome`.
        module InitialEvent
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # Parameters for sending a user message to the session.
          variant :"user.message", -> { Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEventParams }

          # Parameters for defining an outcome the agent should work toward. The agent begins work on receipt.
          variant :"user.define_outcome",
                  -> { Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams }

          module Type
            extend Anthropic::Internal::Type::Enum

            USER_MESSAGE = :"user.message"
            USER_DEFINE_OUTCOME = :"user.define_outcome"

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserMessageEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # @param type [Symbol, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [Array<Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsImageBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsDocumentBlock, Anthropic::Models::Beta::Sessions::BetaManagedAgentsRedactedBlock>] :content Array of content blocks for the user message.
          #
          #   @option args [String] :description What the agent should produce. This is the task specification.
          #
          #   @option args [Anthropic::Models::Beta::Sessions::BetaManagedAgentsFileRubricParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextRubricParams] :rubric Rubric for grading the quality of an outcome.
          #
          #   @option args [Integer, nil] :max_iterations Eval→revision cycles before giving up. Default 3, max 20.
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserMessageEventParams, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams]
          def self.new(type:, **args)
            case type.to_sym
            when :"user.message"
              Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEventParams.new(**args)
            when :"user.define_outcome"
              Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
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
          # {Anthropic::Models::Beta::SessionCreateParams::Resource} for more details.
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
