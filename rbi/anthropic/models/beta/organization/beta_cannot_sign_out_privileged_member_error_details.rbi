# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaCannotSignOutPrivilegedMemberErrorDetails < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaCannotSignOutPrivilegedMemberErrorDetails,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :error_code

          # This OAuth token cannot sign out a membership admin or a member whose roles
          # grant owner, user management, or identity and access management.
          sig { params(error_code: Symbol).returns(T.attached_class) }
          def self.new(error_code: :cannot_sign_out_privileged_member)
          end

          sig { override.returns({ error_code: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
