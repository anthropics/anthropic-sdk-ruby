# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        # A memory store attached to an agent session.
        #
        # @see Anthropic::Resources::Beta::Sessions::Resources#list
        module BetaManagedAgentsSessionResource
          extend Anthropic::Internal::Type::Union

          discriminator :type

          variant :github_repository, -> { Anthropic::Beta::Sessions::BetaManagedAgentsGitHubRepositoryResource }

          variant :file, -> { Anthropic::Beta::Sessions::BetaManagedAgentsFileResource }

          # A memory store attached to an agent session.
          variant :memory_store, -> { Anthropic::Beta::Sessions::BetaManagedAgentsMemoryStoreResource }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::Sessions::BetaManagedAgentsGitHubRepositoryResource, Anthropic::Models::Beta::Sessions::BetaManagedAgentsFileResource, Anthropic::Models::Beta::Sessions::BetaManagedAgentsMemoryStoreResource)]
        end
      end
    end
  end
end
