# typed: strong

module Anthropic
  module Models
    module Organization
      class OrgMemberLimitExceededErrorDetails < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::OrgMemberLimitExceededErrorDetails,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :error_code

        # The organization has reached the member limit that Anthropic set for it. Pending
        # invites count toward the limit.
        sig { params(error_code: Symbol).returns(T.attached_class) }
        def self.new(error_code: :org_member_limit_exceeded)
        end

        sig { override.returns({ error_code: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
