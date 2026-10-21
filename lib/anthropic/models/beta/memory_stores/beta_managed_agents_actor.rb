# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module MemoryStores
        # Identifies who performed an operation. Recorded when the operation happens and
        # not updated afterwards, so the ID may refer to a user, service account, API key,
        # or session that has since been deleted.
        module BetaManagedAgentsActor
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # An agent acting during a session, for example through the session's mounted filesystem. It names the session itself, not the user or API key that started the session.
          variant :session_actor, -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsSessionActor }

          # A direct caller of the public API, identified by the API key that authenticated the request.
          variant :api_actor, -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsAPIActor }

          # A human user, for example acting through the Anthropic Console.
          variant :user_actor, -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsUserActor }

          # A workload authenticated as a service account, for example via Workload Identity Federation.
          variant :service_account_actor, -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsServiceAccountActor }

          module Type
            extend Anthropic::Internal::Type::Enum

            SESSION_ACTOR = :session_actor
            API_ACTOR = :api_actor
            USER_ACTOR = :user_actor
            SERVICE_ACCOUNT_ACTOR = :service_account_actor

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsSessionActor, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsAPIActor, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsUserActor, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsServiceAccountActor)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsActor} for more
          # details.
          #
          # @param type [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsActor::Type, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [String] :session_id ID of the session (a `sesn_...` value). Look up the session via [Retrieve a sess
          #
          #   @option args [String] :api_key_id ID of the API key (an `apikey_...` value). This identifies the key, not the secr
          #
          #   @option args [String] :user_id ID of the user (a `user_...` value).
          #
          #   @option args [String] :service_account_id ID of the service account (a `svac_...` value).
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsSessionActor, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsAPIActor, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsUserActor, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsServiceAccountActor]
          def self.new(type:, **args)
            case type.to_sym
            when :session_actor
              Anthropic::Beta::MemoryStores::BetaManagedAgentsSessionActor.new(**args)
            when :api_actor
              Anthropic::Beta::MemoryStores::BetaManagedAgentsAPIActor.new(**args)
            when :user_actor
              Anthropic::Beta::MemoryStores::BetaManagedAgentsUserActor.new(**args)
            when :service_account_actor
              Anthropic::Beta::MemoryStores::BetaManagedAgentsServiceAccountActor.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end
      end
    end
  end
end
