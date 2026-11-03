# typed: strong

module Anthropic
  module Models
    module Organization
      class AlreadyMemberErrorDetails < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::AlreadyMemberErrorDetails,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :error_code

        # The email address already belongs to a user in the organization. The message
        # names the user.
        sig { params(error_code: Symbol).returns(T.attached_class) }
        def self.new(error_code: :already_member)
        end

        sig { override.returns({ error_code: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
