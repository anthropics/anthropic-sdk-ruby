# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module MemoryStores
        # Identifies who performed a write or redact operation. Captured at write time on
        # the `memory_version` row. The API key that created a session is not recorded on
        # agent writes; attribution answers who made the write, not who is ultimately
        # responsible. Look up session provenance separately via the
        # [Sessions API](/en/api/sessions-retrieve).
        module BetaManagedAgentsActor
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # Attribution for a write made by an agent during a session, through the mounted filesystem at `/mnt/memory/`.
          variant :session_actor, -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsSessionActor }

          # Attribution for a write made directly via the public API (outside of any session).
          variant :api_actor, -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsAPIActor }

          # Attribution for a write made by a human user through the Anthropic Console.
          variant :user_actor, -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsUserActor }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsSessionActor, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsAPIActor, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsUserActor)]
        end
      end
    end
  end
end
