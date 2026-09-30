# typed: strong

module Anthropic
  module Models
    module Organization
      class APIKeyUserActor < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::APIKeyUserActor,
              Anthropic::Internal::AnyHash
            )
          end

        # Principal type. Always `"user_actor"` for a User.
        sig { returns(Symbol) }
        attr_accessor :type

        # ID of the User the API key acts as.
        sig { returns(String) }
        attr_accessor :user_id

        sig { params(user_id: String, type: Symbol).returns(T.attached_class) }
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
