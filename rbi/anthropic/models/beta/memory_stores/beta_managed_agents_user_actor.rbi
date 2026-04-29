# typed: strong

module Anthropic
  module Models
    module Beta
      module MemoryStores
        class BetaManagedAgentsUserActor < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::MemoryStores::BetaManagedAgentsUserActor,
                Anthropic::Internal::AnyHash
              )
            end

          sig do
            returns(
              Anthropic::Beta::MemoryStores::BetaManagedAgentsUserActor::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # ID of the user who performed the write (a `user_...` value).
          sig { returns(String) }
          attr_accessor :user_id

          # Attribution for a write made by a human user through the Anthropic Console.
          sig do
            params(
              type:
                Anthropic::Beta::MemoryStores::BetaManagedAgentsUserActor::Type::OrSymbol,
              user_id: String
            ).returns(T.attached_class)
          end
          def self.new(
            type:,
            # ID of the user who performed the write (a `user_...` value).
            user_id:
          )
          end

          sig do
            override.returns(
              {
                type:
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsUserActor::Type::TaggedSymbol,
                user_id: String
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
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsUserActor::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            USER_ACTOR =
              T.let(
                :user_actor,
                Anthropic::Beta::MemoryStores::BetaManagedAgentsUserActor::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::MemoryStores::BetaManagedAgentsUserActor::Type::TaggedSymbol
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
