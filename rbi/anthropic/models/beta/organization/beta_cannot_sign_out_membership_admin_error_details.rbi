# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaCannotSignOutMembershipAdminErrorDetails < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaCannotSignOutMembershipAdminErrorDetails,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :error_code

          # The member is a membership admin, and the person the API key or token belongs to
          # is not allowed to sign out membership admins.
          sig { params(error_code: Symbol).returns(T.attached_class) }
          def self.new(error_code: :cannot_sign_out_membership_admin)
          end

          sig { override.returns({ error_code: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
