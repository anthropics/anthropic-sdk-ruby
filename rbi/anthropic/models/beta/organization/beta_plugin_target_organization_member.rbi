# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaPluginTargetOrganizationMember < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaPluginTargetOrganizationMember,
                Anthropic::Internal::AnyHash
              )
            end

          # One member of the organization.
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
            # One member of the organization.
            type: :organization_member
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
