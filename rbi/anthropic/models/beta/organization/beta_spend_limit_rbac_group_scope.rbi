# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaSpendLimitRBACGroupScope < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaSpendLimitRBACGroupScope,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :rbac_group_id

          sig { returns(Symbol) }
          attr_accessor :type

          sig do
            params(rbac_group_id: String, type: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(rbac_group_id:, type: :rbac_group)
          end

          sig { override.returns({ rbac_group_id: String, type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
