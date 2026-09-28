# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaPluginOwnerUser < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaPluginOwnerUser,
                Anthropic::Internal::AnyHash
              )
            end

          # The Plugin lives in one member's personal plugin marketplace.
          sig { returns(Symbol) }
          attr_accessor :type

          # The member's User ID.
          sig { returns(String) }
          attr_accessor :user_id

          sig do
            params(user_id: String, type: Symbol).returns(T.attached_class)
          end
          def self.new(
            # The member's User ID.
            user_id:,
            # The Plugin lives in one member's personal plugin marketplace.
            type: :user
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
