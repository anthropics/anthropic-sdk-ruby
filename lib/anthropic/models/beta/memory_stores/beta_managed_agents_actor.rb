# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module MemoryStores
        # Identifies who performed a write or redact operation. Captured at write time on
        # the `memory_version` row. The API key that created a session is not recorded on
        # agent writes; attribution answers who made the write, not who is ultimately
        # responsible. Look up session provenance separately via the
        # [Sessions API](/en/api/beta/sessions/retrieve).
        module BetaManagedAgentsActor
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # Attribution for a write made by an agent during a session, through the mounted filesystem at `/mnt/memory/`.
          variant :session_actor, -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsSessionActor }

          # Attribution for a write made directly via the public API (outside of any session).
          variant :api_actor, -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsAPIActor }

          # Attribution for a write made by a human user through the Anthropic Console.
          variant :user_actor, -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsUserActor }

          # Attribution for a write made by a workload authenticated as a service account, for example via Workload Identity Federation.
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
          # @param type [Symbol, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [String] :session_id ID of the session that performed the write (a `sesn_...` value). Look up the ses
          #
          #   @option args [String] :api_key_id ID of the API key that performed the write. This identifies the key, not the sec
          #
          #   @option args [String] :user_id ID of the user who performed the write (a `user_...` value).
          #
          #   @option args [String] :service_account_id ID of the service account that performed the write (a `svac_...` value).
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
