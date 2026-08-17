# typed: strong

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

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::MemoryStores::BetaManagedAgentsSessionActor,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsAPIActor,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsUserActor,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsServiceAccountActor
              )
            end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::MemoryStores::BetaManagedAgentsActor::Variants
              ]
            )
          end
          def self.variants
          end

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          sig do
            params(
              type: T.any(Symbol, String),
              session_id: String,
              api_key_id: String,
              user_id: String,
              service_account_id: String
            ).returns(
              Anthropic::Beta::MemoryStores::BetaManagedAgentsActor::Variants
            )
          end
          def self.new(
            type:,
            # ID of the session that performed the write (a `sesn_...` value). Look up the
            # session via [Retrieve a session](/en/api/sessions-retrieve) for further
            # provenance.
            session_id: nil,
            # ID of the API key that performed the write. This identifies the key, not the
            # secret.
            api_key_id: nil,
            # ID of the user who performed the write (a `user_...` value).
            user_id: nil,
            # ID of the service account that performed the write (a `svac_...` value).
            service_account_id: nil
          )
          end
        end
      end
    end
  end
end
