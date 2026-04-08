# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsGitHubRepositoryResourceParams < Anthropic::Internal::Type::BaseModel
        # @!attribute authorization_token
        #   GitHub authorization token used to clone the repository.
        #
        #   @return [String]
        required :authorization_token, String

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsGitHubRepositoryResourceParams::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsGitHubRepositoryResourceParams::Type }

        # @!attribute url
        #   Github URL of the repository
        #
        #   @return [String]
        required :url, String

        # @!attribute checkout
        #   Branch or commit to check out. Defaults to the repository's default branch.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsBranchCheckout, Anthropic::Models::Beta::BetaManagedAgentsCommitCheckout, nil]
        optional :checkout,
                 union: -> { Anthropic::Beta::BetaManagedAgentsGitHubRepositoryResourceParams::Checkout },
                 nil?: true

        # @!attribute mount_path
        #   Mount path in the container. Defaults to `/workspace/<repo-name>`.
        #
        #   @return [String, nil]
        optional :mount_path, String, nil?: true

        # @!method initialize(authorization_token:, type:, url:, checkout: nil, mount_path: nil)
        #   Mount a GitHub repository into the session's container.
        #
        #   @param authorization_token [String] GitHub authorization token used to clone the repository.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsGitHubRepositoryResourceParams::Type]
        #
        #   @param url [String] Github URL of the repository
        #
        #   @param checkout [Anthropic::Models::Beta::BetaManagedAgentsBranchCheckout, Anthropic::Models::Beta::BetaManagedAgentsCommitCheckout, nil] Branch or commit to check out. Defaults to the repository's default branch.
        #
        #   @param mount_path [String, nil] Mount path in the container. Defaults to `/workspace/<repo-name>`.

        # @see Anthropic::Models::Beta::BetaManagedAgentsGitHubRepositoryResourceParams#type
        module Type
          extend Anthropic::Internal::Type::Enum

          GITHUB_REPOSITORY = :github_repository

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # Branch or commit to check out. Defaults to the repository's default branch.
        #
        # @see Anthropic::Models::Beta::BetaManagedAgentsGitHubRepositoryResourceParams#checkout
        module Checkout
          extend Anthropic::Internal::Type::Union

          discriminator :type

          variant :branch, -> { Anthropic::Beta::BetaManagedAgentsBranchCheckout }

          variant :commit, -> { Anthropic::Beta::BetaManagedAgentsCommitCheckout }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaManagedAgentsBranchCheckout, Anthropic::Models::Beta::BetaManagedAgentsCommitCheckout)]
        end
      end
    end

    BetaManagedAgentsGitHubRepositoryResourceParams = Beta::BetaManagedAgentsGitHubRepositoryResourceParams
  end
end
