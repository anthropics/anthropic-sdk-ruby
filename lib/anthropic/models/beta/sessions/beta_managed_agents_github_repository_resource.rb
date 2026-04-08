# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsGitHubRepositoryResource < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #
          #   @return [String]
          required :id, String

          # @!attribute created_at
          #   A timestamp in RFC 3339 format
          #
          #   @return [Time]
          required :created_at, Time

          # @!attribute mount_path
          #
          #   @return [String]
          required :mount_path, String

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsGitHubRepositoryResource::Type]
          required :type, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsGitHubRepositoryResource::Type }

          # @!attribute updated_at
          #   A timestamp in RFC 3339 format
          #
          #   @return [Time]
          required :updated_at, Time

          # @!attribute url
          #
          #   @return [String]
          required :url, String

          # @!attribute checkout
          #
          #   @return [Anthropic::Models::Beta::BetaManagedAgentsBranchCheckout, Anthropic::Models::Beta::BetaManagedAgentsCommitCheckout, nil]
          optional :checkout,
                   union: -> {
                     Anthropic::Beta::Sessions::BetaManagedAgentsGitHubRepositoryResource::Checkout
                   },
                   nil?: true

          # @!method initialize(id:, created_at:, mount_path:, type:, updated_at:, url:, checkout: nil)
          #   @param id [String]
          #
          #   @param created_at [Time] A timestamp in RFC 3339 format
          #
          #   @param mount_path [String]
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsGitHubRepositoryResource::Type]
          #
          #   @param updated_at [Time] A timestamp in RFC 3339 format
          #
          #   @param url [String]
          #
          #   @param checkout [Anthropic::Models::Beta::BetaManagedAgentsBranchCheckout, Anthropic::Models::Beta::BetaManagedAgentsCommitCheckout, nil]

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsGitHubRepositoryResource#type
          module Type
            extend Anthropic::Internal::Type::Enum

            GITHUB_REPOSITORY = :github_repository

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsGitHubRepositoryResource#checkout
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
    end
  end
end
