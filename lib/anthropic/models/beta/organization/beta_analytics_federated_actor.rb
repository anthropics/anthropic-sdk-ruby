# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsFederatedActor < Anthropic::Internal::Type::BaseModel
          # @!attribute provider
          #   The trusted provider that asserted the caller's identity.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsFederatedActorAWSProvider, Anthropic::Models::Beta::Organization::BetaAnalyticsFederatedActorAzureProvider, Anthropic::Models::Beta::Organization::BetaAnalyticsFederatedActorGCPProvider, Anthropic::Models::Beta::Organization::BetaAnalyticsFederatedActorOIDCProvider]
          required :provider, union: -> { Anthropic::Beta::Organization::BetaAnalyticsFederatedActorProvider }

          # @!attribute subject
          #   The provider's identifier for the caller: on `aws`, the IAM principal ARN (one
          #   role is one actor across its sessions); on `gcp`, the caller's IAM principal
          #   identifier as Google Cloud reports it, such as `serviceAccount:<email>`,
          #   `user:<email>`, or a `principal://...` URI.
          #
          #   @return [String, nil]
          required :subject, String, nil?: true

          # @!attribute type
          #
          #   @return [Symbol, :federated_actor]
          required :type, const: :federated_actor

          # @!method initialize(provider:, subject:, type: :federated_actor)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaAnalyticsFederatedActor} for more
          #   details.
          #
          #   @param provider [Anthropic::Models::Beta::Organization::BetaAnalyticsFederatedActorAWSProvider, Anthropic::Models::Beta::Organization::BetaAnalyticsFederatedActorAzureProvider, Anthropic::Models::Beta::Organization::BetaAnalyticsFederatedActorGCPProvider, Anthropic::Models::Beta::Organization::BetaAnalyticsFederatedActorOIDCProvider] The trusted provider that asserted the caller's identity.
          #
          #   @param subject [String, nil] The provider's identifier for the caller: on `aws`, the IAM principal ARN (one r
          #
          #   @param type [Symbol, :federated_actor]
        end
      end
    end
  end
end
