# typed: strong

module Anthropic
  module Models
    module Organization
      class CannotInviteEmailsWithUnverifiedDomainsErrorDetails < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::CannotInviteEmailsWithUnverifiedDomainsErrorDetails,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :error_code

        # The email address's domain is not one of the verified domains of the
        # organization's parent organization.
        sig { params(error_code: Symbol).returns(T.attached_class) }
        def self.new(error_code: :cannot_invite_emails_with_unverified_domains)
        end

        sig { override.returns({ error_code: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
