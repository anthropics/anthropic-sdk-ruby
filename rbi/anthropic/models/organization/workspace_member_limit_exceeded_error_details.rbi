# typed: strong

module Anthropic
  module Models
    module Organization
      class WorkspaceMemberLimitExceededErrorDetails < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::WorkspaceMemberLimitExceededErrorDetails,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :error_code

        # The workspace has reached the member limit that Anthropic set for it.
        sig { params(error_code: Symbol).returns(T.attached_class) }
        def self.new(error_code: :workspace_member_limit_exceeded)
        end

        sig { override.returns({ error_code: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
