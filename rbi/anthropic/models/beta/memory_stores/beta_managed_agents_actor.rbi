# typed: strong

module Anthropic
  module Models
    module Beta
      module MemoryStores
        # Identifies who performed an operation. Recorded when the operation happens and
        # not updated afterwards, so the ID may refer to a user, service account, API key,
        # or session that has since been deleted.
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

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsActor::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            SESSION_ACTOR =
              T.let(
                :session_actor,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsActor::Type::TaggedSymbol
              )
            API_ACTOR =
              T.let(
                :api_actor,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsActor::Type::TaggedSymbol
              )
            USER_ACTOR =
              T.let(
                :user_actor,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsActor::Type::TaggedSymbol
              )
            SERVICE_ACCOUNT_ACTOR =
              T.let(
                :service_account_actor,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsActor::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsActor::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
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
              type:
                Anthropic::Beta::MemoryStores::BetaManagedAgentsActor::Type::OrSymbol,
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
            # ID of the session (a `sesn_...` value). Look up the session via
            # [Retrieve a session](/en/api/beta/sessions/retrieve) for further provenance.
            session_id: nil,
            # ID of the API key (an `apikey_...` value). This identifies the key, not the
            # secret.
            api_key_id: nil,
            # ID of the user (a `user_...` value).
            user_id: nil,
            # ID of the service account (a `svac_...` value).
            service_account_id: nil
          )
          end
        end
      end
    end
  end
end
