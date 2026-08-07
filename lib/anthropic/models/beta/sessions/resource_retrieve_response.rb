# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        # The requested session resource.
        #
        # @see Anthropic::Resources::Beta::Sessions::Resources#retrieve
        module ResourceRetrieveResponse
          extend Anthropic::Internal::Type::Union

          discriminator :type

          variant :github_repository, -> { Anthropic::Beta::Sessions::BetaManagedAgentsGitHubRepositoryResource }

          variant :file, -> { Anthropic::Beta::Sessions::BetaManagedAgentsFileResource }

          # A memory store attached to an agent session.
          variant :memory_store, -> { Anthropic::Beta::Sessions::BetaManagedAgentsMemoryStoreResource }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::Sessions::BetaManagedAgentsGitHubRepositoryResource, Anthropic::Models::Beta::Sessions::BetaManagedAgentsFileResource, Anthropic::Models::Beta::Sessions::BetaManagedAgentsMemoryStoreResource)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Sessions::ResourceRetrieveResponse} for more details.
          #
          # @param type [Symbol, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [String] :id
          #
          #   @option args [Time] :created_at A timestamp in RFC 3339 format
          #
          #   @option args [String, String, nil] :mount_path Filesystem path where the store is mounted in the session container, e.g. /mnt/m
          #
          #   @option args [Time] :updated_at A timestamp in RFC 3339 format
          #
          #   @option args [String] :url
          #
          #   @option args [Anthropic::Models::Beta::BetaManagedAgentsBranchCheckout, Anthropic::Models::Beta::BetaManagedAgentsCommitCheckout, nil] :checkout
          #
          #   @option args [String] :file_id
          #
          #   @option args [String] :memory_store_id The memory store ID (memstore\_...). Must belong to the caller's organization
          #   and
          #
          #   @option args [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsMemoryStoreResource::Access, nil] :access Access mode for an attached memory store.
          #
          #   @option args [String] :description Description of the memory store, snapshotted at attach time. Rendered into the a
          #
          #   @option args [String, nil] :instructions Per-attachment guidance for the agent on how to use this store. Rendered into th
          #
          #   @option args [String, nil] :name Display name of the memory store, snapshotted at attach time. Later edits to the
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsGitHubRepositoryResource, Anthropic::Models::Beta::Sessions::BetaManagedAgentsFileResource, Anthropic::Models::Beta::Sessions::BetaManagedAgentsMemoryStoreResource]
          def self.new(type:, **args)
            case type.to_sym
            when :github_repository
              Anthropic::Beta::Sessions::BetaManagedAgentsGitHubRepositoryResource.new(**args)
            when :file
              Anthropic::Beta::Sessions::BetaManagedAgentsFileResource.new(**args)
            when :memory_store
              Anthropic::Beta::Sessions::BetaManagedAgentsMemoryStoreResource.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end
      end
    end
  end
end
