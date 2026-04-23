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

          sig { returns(String) }
          attr_accessor :session_id

          sig do
            returns(
              Anthropic::Beta::MemoryStores::BetaManagedAgentsSessionActor::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          sig do
            params(
              session_id: String,
              type:
                Anthropic::Beta::MemoryStores::BetaManagedAgentsSessionActor::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(session_id:, type:)
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
