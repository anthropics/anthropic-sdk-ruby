# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module BetaAnalyticsActor
          extend Anthropic::Internal::Type::Union

          discriminator :type

          variant :user_actor, -> { Anthropic::Beta::Organization::BetaAnalyticsReportUserActor }

          variant :service_account_actor, -> { Anthropic::Beta::Organization::BetaAnalyticsServiceAccountActor }

          variant :federated_actor, -> { Anthropic::Beta::Organization::BetaAnalyticsFederatedActor }

          variant :api_actor, -> { Anthropic::Beta::Organization::BetaAnalyticsAPIActor }

          module Type
            extend Anthropic::Internal::Type::Enum

            USER_ACTOR = :user_actor
            SERVICE_ACCOUNT_ACTOR = :service_account_actor
            FEDERATED_ACTOR = :federated_actor
            API_ACTOR = :api_actor

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::Organization::BetaAnalyticsReportUserActor, Anthropic::Models::Beta::Organization::BetaAnalyticsServiceAccountActor, Anthropic::Models::Beta::Organization::BetaAnalyticsFederatedActor, Anthropic::Models::Beta::Organization::BetaAnalyticsAPIActor)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Organization::BetaAnalyticsActor} for more details.
          #
          # @param type [Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsActor::Type, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [Boolean] :deleted True when the account has been deleted, or when the user is no longer a member o
          #
          #   @option args [String, nil] :email_address The user's current email address, including for users who are no longer members
          #
          #   @option args [String, nil] :name The user's current full name. Null when the user has not set one. `"Deleted User
          #
          #   @option args [String] :user_id Tagged user ID.
          #
          #   @option args [String] :service_account_id Tagged service account ID.
          #
          #   @option args [Anthropic::Models::Beta::Organization::BetaAnalyticsFederatedActorAWSProvider, Anthropic::Models::Beta::Organization::BetaAnalyticsFederatedActorAzureProvider, Anthropic::Models::Beta::Organization::BetaAnalyticsFederatedActorGCPProvider, Anthropic::Models::Beta::Organization::BetaAnalyticsFederatedActorOIDCProvider] :provider The trusted provider that asserted the caller's identity.
          #
          #   @option args [String, nil] :subject The provider's identifier for the caller: on `aws`, the IAM principal ARN (one r
          #
          #   @option args [String] :api_key_id Tagged API key ID.
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::Organization::BetaAnalyticsReportUserActor, Anthropic::Models::Beta::Organization::BetaAnalyticsServiceAccountActor, Anthropic::Models::Beta::Organization::BetaAnalyticsFederatedActor, Anthropic::Models::Beta::Organization::BetaAnalyticsAPIActor]
          def self.new(type:, **args)
            case type.to_sym
            when :user_actor
              Anthropic::Beta::Organization::BetaAnalyticsReportUserActor.new(**args)
            when :service_account_actor
              Anthropic::Beta::Organization::BetaAnalyticsServiceAccountActor.new(**args)
            when :federated_actor
              Anthropic::Beta::Organization::BetaAnalyticsFederatedActor.new(**args)
            when :api_actor
              Anthropic::Beta::Organization::BetaAnalyticsAPIActor.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end
      end
    end
  end
end
