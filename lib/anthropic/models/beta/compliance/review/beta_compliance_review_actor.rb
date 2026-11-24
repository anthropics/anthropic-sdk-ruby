# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          # Who sent a message.
          module BetaComplianceReviewActor
            extend Anthropic::Internal::Type::Union

            discriminator :type

            # A signed-in user.
            variant :user_actor, -> { Anthropic::Beta::Compliance::Review::BetaComplianceReviewUserActor }

            # An API key.
            variant :api_actor, -> { Anthropic::Beta::Compliance::Review::BetaComplianceReviewAPIActor }

            # A service account.
            variant :service_account_actor,
                    -> { Anthropic::Beta::Compliance::Review::BetaComplianceReviewServiceAccountActor }

            module Type
              extend Anthropic::Internal::Type::Enum

              USER_ACTOR = :user_actor
              API_ACTOR = :api_actor
              SERVICE_ACCOUNT_ACTOR = :service_account_actor

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @!method self.variants
            #   @return [Array(Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewUserActor, Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewAPIActor, Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewServiceAccountActor)]

            # Creates a new instance of the variant class whose `type` matches the given
            # value, passing the remaining arguments to its constructor.
            #
            # Some parameter documentations has been truncated, see
            # {Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewActor} for
            # more details.
            #
            # @param type [Symbol, Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewActor::Type, String]
            #
            # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
            #
            #   @option args [String, nil] :email_address The user's email address. Set only for a current member of an organization that
            #
            #   @option args [String] :user_id The ID of the user (`user_...`).
            #
            #   @option args [String] :api_key_id The ID of the API key (`apikey_...`).
            #
            #   @option args [String] :service_account_id The ID of the service account (`svac_...`).
            #
            # @raise [ArgumentError]
            # @return [Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewUserActor, Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewAPIActor, Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewServiceAccountActor]
            def self.new(type:, **args)
              case type.to_sym
              when :user_actor
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewUserActor.new(**args)
              when :api_actor
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewAPIActor.new(**args)
              when :service_account_actor
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewServiceAccountActor.new(**args)
              else
                raise ArgumentError, "unknown type: #{type}"
              end
            end
          end
        end
      end
    end
  end
end
