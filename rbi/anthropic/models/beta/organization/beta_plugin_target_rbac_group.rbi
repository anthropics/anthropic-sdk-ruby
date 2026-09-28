# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaPluginTargetRBACGroup < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaPluginTargetRBACGroup,
                Anthropic::Internal::AnyHash
              )
            end

          # The RBAC Group's ID.
          sig { returns(String) }
          attr_accessor :rbac_group_id

          # An RBAC Group.
          sig { returns(Symbol) }
          attr_accessor :type

          sig do
            params(rbac_group_id: String, type: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(
            # The RBAC Group's ID.
            rbac_group_id:,
            # An RBAC Group.
            type: :rbac_group
          )
          end

          sig { override.returns({ rbac_group_id: String, type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
