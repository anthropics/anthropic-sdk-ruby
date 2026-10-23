# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module BetaAnalyticsFederatedActorProvider
          extend Anthropic::Internal::Type::Union

          discriminator :type

          variant :aws, -> { Anthropic::Beta::Organization::BetaAnalyticsFederatedActorAWSProvider }

          variant :azure, -> { Anthropic::Beta::Organization::BetaAnalyticsFederatedActorAzureProvider }

          variant :gcp, -> { Anthropic::Beta::Organization::BetaAnalyticsFederatedActorGCPProvider }

          variant :oidc, -> { Anthropic::Beta::Organization::BetaAnalyticsFederatedActorOIDCProvider }

          module Type
            extend Anthropic::Internal::Type::Enum

            AWS = :aws
            AZURE = :azure
            GCP = :gcp
            OIDC = :oidc

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::Organization::BetaAnalyticsFederatedActorAWSProvider, Anthropic::Models::Beta::Organization::BetaAnalyticsFederatedActorAzureProvider, Anthropic::Models::Beta::Organization::BetaAnalyticsFederatedActorGCPProvider, Anthropic::Models::Beta::Organization::BetaAnalyticsFederatedActorOIDCProvider)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # @param type [Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsFederatedActorProvider::Type, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [String] :account_id The AWS account the organization is bound to.
          #
          #   @option args [String] :signed_principal The AWS-signed ARN of the IAM principal that made the requests.
          #
          #   @option args [String] :subscription_id The Azure subscription the organization is bound to.
          #
          #   @option args [String] :project_number The Google Cloud project the organization is bound to.
          #
          #   @option args [String, nil] :issuer The federation issuer's URL.
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::Organization::BetaAnalyticsFederatedActorAWSProvider, Anthropic::Models::Beta::Organization::BetaAnalyticsFederatedActorAzureProvider, Anthropic::Models::Beta::Organization::BetaAnalyticsFederatedActorGCPProvider, Anthropic::Models::Beta::Organization::BetaAnalyticsFederatedActorOIDCProvider]
          def self.new(type:, **args)
            case type.to_sym
            when :aws
              Anthropic::Beta::Organization::BetaAnalyticsFederatedActorAWSProvider.new(**args)
            when :azure
              Anthropic::Beta::Organization::BetaAnalyticsFederatedActorAzureProvider.new(**args)
            when :gcp
              Anthropic::Beta::Organization::BetaAnalyticsFederatedActorGCPProvider.new(**args)
            when :oidc
              Anthropic::Beta::Organization::BetaAnalyticsFederatedActorOIDCProvider.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end
      end
    end
  end
end
