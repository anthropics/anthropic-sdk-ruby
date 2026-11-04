# typed: strong

module Anthropic
  module Models
    module Organization
      class EmailDomainNotAllowedErrorDetails < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::EmailDomainNotAllowedErrorDetails,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :error_code

        # The organization restricts invites to an allowed list of email domains, and the
        # list is empty or does not include the email address's domain.
        sig { params(error_code: Symbol).returns(T.attached_class) }
        def self.new(error_code: :email_domain_not_allowed)
        end

        sig { override.returns({ error_code: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
