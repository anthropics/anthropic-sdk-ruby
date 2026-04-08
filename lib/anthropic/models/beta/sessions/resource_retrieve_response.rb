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

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::Sessions::BetaManagedAgentsGitHubRepositoryResource, Anthropic::Models::Beta::Sessions::BetaManagedAgentsFileResource)]
        end
      end
    end
  end
end
