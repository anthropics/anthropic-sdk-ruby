# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module RBACRoles
          class BetaRBACOrganizationPermissionResource < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::RBACRoles::BetaRBACOrganizationPermissionResource,
                  Anthropic::Internal::AnyHash
                )
              end

            # UUID of the organization the permission applies to.
            sig { returns(String) }
            attr_accessor :organization_id

            # Kind of resource the permission applies to.
            sig { returns(Symbol) }
            attr_accessor :type

            sig do
              params(organization_id: String, type: Symbol).returns(
                T.attached_class
              )
            end
            def self.new(
              # UUID of the organization the permission applies to.
              organization_id:,
              # Kind of resource the permission applies to.
              type: :organization
            )
            end

            sig { override.returns({ organization_id: String, type: Symbol }) }
            def to_hash
            end
          end
        end
      end
    end
  end
end
