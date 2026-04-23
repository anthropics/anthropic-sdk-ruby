# typed: strong

module Anthropic
  module Models
    module Beta
      module MemoryStores
        class BetaManagedAgentsAPIActor < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::MemoryStores::BetaManagedAgentsAPIActor,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :api_key_id

          sig do
            returns(
              Anthropic::Beta::MemoryStores::BetaManagedAgentsAPIActor::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          sig do
            params(
              api_key_id: String,
              type:
                Anthropic::Beta::MemoryStores::BetaManagedAgentsAPIActor::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(api_key_id:, type:)
          end

          sig do
            override.returns(
              {
                api_key_id: String,
                type:
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsAPIActor::Type::TaggedSymbol
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
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsAPIActor::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            API_ACTOR =
              T.let(
                :api_actor,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsAPIActor::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsAPIActor::Type::TaggedSymbol
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
