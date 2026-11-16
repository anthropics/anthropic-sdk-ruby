# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaRBACRoleSourceBuiltIn < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaRBACRoleSourceBuiltIn,
                Anthropic::Internal::AnyHash
              )
            end

          # Anthropic provisions the RBAC Role, and the organization's administrators cannot
          # change or delete it.
          sig { returns(Symbol) }
          attr_accessor :type

          sig { params(type: Symbol).returns(T.attached_class) }
          def self.new(
            # Anthropic provisions the RBAC Role, and the organization's administrators cannot
            # change or delete it.
            type: :built_in
          )
          end

          sig { override.returns({ type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
