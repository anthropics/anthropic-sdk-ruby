# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # A configured session resource. Echoes the input minus write-only credentials.
      module BetaManagedAgentsSessionResourceConfig
        extend Anthropic::Internal::Type::Union

        discriminator :type

        # A GitHub repository mounted into each session's container. The authorization token is write-only and never returned.
        variant :github_repository, -> { Anthropic::Beta::BetaManagedAgentsGitHubRepositoryResourceConfig }

        # A file mounted into each session's container.
        variant :file, -> { Anthropic::Beta::BetaManagedAgentsFileResourceConfig }

        # A memory store attached to each session created from this deployment.
        variant :memory_store, -> { Anthropic::Beta::BetaManagedAgentsMemoryStoreResourceConfig }

        module Type
          extend Anthropic::Internal::Type::Enum

          GITHUB_REPOSITORY = :github_repository
          FILE = :file
          MEMORY_STORE = :memory_store

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaManagedAgentsGitHubRepositoryResourceConfig, Anthropic::Models::Beta::BetaManagedAgentsFileResourceConfig, Anthropic::Models::Beta::BetaManagedAgentsMemoryStoreResourceConfig)]

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::BetaManagedAgentsSessionResourceConfig} for more
        # details.
        #
        # @param type [Symbol, String]
        #
        # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
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
        #   @option args [Symbol, Anthropic::Models::Beta::BetaManagedAgentsMemoryStoreResourceConfig::Access, nil] :access Access mode for an attached memory store.
        #
        #   @option args [String, nil] :instructions Per-attachment guidance for the agent on how to use this store. Rendered into th
        #
        # @raise [ArgumentError]
        # @return [Anthropic::Models::Beta::BetaManagedAgentsGitHubRepositoryResourceConfig, Anthropic::Models::Beta::BetaManagedAgentsFileResourceConfig, Anthropic::Models::Beta::BetaManagedAgentsMemoryStoreResourceConfig]
        def self.new(type:, **args)
          case type.to_sym
          when :github_repository
            Anthropic::Beta::BetaManagedAgentsGitHubRepositoryResourceConfig.new(**args)
          when :file
            Anthropic::Beta::BetaManagedAgentsFileResourceConfig.new(**args)
          when :memory_store
            Anthropic::Beta::BetaManagedAgentsMemoryStoreResourceConfig.new(**args)
          else
            raise ArgumentError, "unknown type: #{type}"
          end
        end
      end
    end

    BetaManagedAgentsSessionResourceConfig = Beta::BetaManagedAgentsSessionResourceConfig
  end
end
