# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaCannotSignOutManagedMemberErrorDetails < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaCannotSignOutManagedMemberErrorDetails,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :error_code

          # On a public-sector deployment, only an API key or token that belongs to a person
          # with owner permissions can sign out a member with the `managed` role.
          sig { params(error_code: Symbol).returns(T.attached_class) }
          def self.new(error_code: :cannot_sign_out_managed_member)
          end

          sig { override.returns({ error_code: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
