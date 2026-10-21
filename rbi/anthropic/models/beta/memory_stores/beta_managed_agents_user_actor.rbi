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

          sig { returns(Symbol) }
          attr_accessor :type

          # ID of the user (a `user_...` value).
          sig { returns(String) }
          attr_accessor :user_id

          # A human user, for example acting through the Anthropic Console.
          sig do
            params(user_id: String, type: Symbol).returns(T.attached_class)
          end
          def self.new(
            # ID of the user (a `user_...` value).
            user_id:,
            type: :user_actor
          )
          end

          sig { override.returns({ type: Symbol, user_id: String }) }
          def to_hash
          end
        end
      end
    end
  end
end
