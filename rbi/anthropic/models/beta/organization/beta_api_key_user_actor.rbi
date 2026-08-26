# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAPIKeyUserActor < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAPIKeyUserActor,
                Anthropic::Internal::AnyHash
              )
            end

          # Principal type. Always `"user_actor"` for a User.
          sig { returns(Symbol) }
          attr_accessor :type

          # ID of the User the API key acts as.
          sig { returns(String) }
          attr_accessor :user_id

          sig do
            params(user_id: String, type: Symbol).returns(T.attached_class)
          end
          def self.new(
            # ID of the User the API key acts as.
            user_id:,
            # Principal type. Always `"user_actor"` for a User.
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
