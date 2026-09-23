# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module MemoryStores
        class BetaManagedAgentsSessionActor < Anthropic::Internal::Type::BaseModel
          # @!attribute session_id
          #   ID of the session (a `sesn_...` value). Look up the session via
          #   [Retrieve a session](/en/api/beta/sessions/retrieve) for further provenance.
          #
          #   @return [String]
          required :session_id, String

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsSessionActor::Type]
          required :type, enum: -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsSessionActor::Type }

          # @!method initialize(session_id:, type:)
          #   An agent acting during a session, for example through the session's mounted
          #   filesystem. It names the session itself, not the user or API key that started
          #   the session.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsSessionActor} for more
          #   details.
          #
          #   @param session_id [String] ID of the session (a `sesn_...` value). Look up the session via [Retrieve a sess
          #
          #   @param type [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsSessionActor::Type]

          # @see Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsSessionActor#type
          module Type
            extend Anthropic::Internal::Type::Enum

            SESSION_ACTOR = :session_actor

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
