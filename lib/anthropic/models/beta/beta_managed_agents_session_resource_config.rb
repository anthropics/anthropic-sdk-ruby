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

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaManagedAgentsGitHubRepositoryResourceConfig, Anthropic::Models::Beta::BetaManagedAgentsFileResourceConfig, Anthropic::Models::Beta::BetaManagedAgentsMemoryStoreResourceConfig)]
      end
    end

    BetaManagedAgentsSessionResourceConfig = Beta::BetaManagedAgentsSessionResourceConfig
  end
end
