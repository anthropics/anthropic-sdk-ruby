# typed: strong

module Anthropic
  module Models
    module Organization
      class SpendLimitUserScope < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::SpendLimitUserScope,
              Anthropic::Internal::AnyHash
            )
          end

        # Scope type. Always `user` for this scope.
        sig { returns(Symbol) }
        attr_accessor :type

        # Tagged ID of the member the spend limit applies to.
        sig { returns(String) }
        attr_accessor :user_id

        # Scope selecting a single member of the organization.
        sig { params(user_id: String, type: Symbol).returns(T.attached_class) }
        def self.new(
          # Tagged ID of the member the spend limit applies to.
          user_id:,
          # Scope type. Always `user` for this scope.
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
