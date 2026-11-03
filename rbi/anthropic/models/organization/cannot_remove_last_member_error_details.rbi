# typed: strong

module Anthropic
  module Models
    module Organization
      class CannotRemoveLastMemberErrorDetails < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::CannotRemoveLastMemberErrorDetails,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :error_code

        # The user is the organization's only member. Add another member before removing
        # this one.
        sig { params(error_code: Symbol).returns(T.attached_class) }
        def self.new(error_code: :cannot_remove_last_member)
        end

        sig { override.returns({ error_code: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
