# typed: strong

module Anthropic
  module Models
    module Beta
      module MemoryStores
        class BetaManagedAgentsSessionActor < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::MemoryStores::BetaManagedAgentsSessionActor,
                Anthropic::Internal::AnyHash
              )
            end

          # ID of the session (a `sesn_...` value). Look up the session via
          # [Retrieve a session](/en/api/beta/sessions/retrieve) for further provenance.
          sig { returns(String) }
          attr_accessor :session_id

          sig do
            returns(
              Anthropic::Beta::MemoryStores::BetaManagedAgentsSessionActor::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # An agent acting during a session, for example through the session's mounted
          # filesystem. It names the session itself, not the user or API key that started
          # the session.
          sig do
            params(
              session_id: String,
              type:
                Anthropic::Beta::MemoryStores::BetaManagedAgentsSessionActor::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # ID of the session (a `sesn_...` value). Look up the session via
            # [Retrieve a session](/en/api/beta/sessions/retrieve) for further provenance.
            session_id:,
            type:
          )
          end

          sig do
            override.returns(
              {
                session_id: String,
                type:
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsSessionActor::Type::TaggedSymbol
              }
            )
          end
          def to_hash
          end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsSessionActor::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            SESSION_ACTOR =
              T.let(
                :session_actor,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsSessionActor::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsSessionActor::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end
    end
  end
end
