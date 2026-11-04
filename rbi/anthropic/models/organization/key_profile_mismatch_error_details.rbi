# typed: strong

module Anthropic
  module Models
    module Organization
      class KeyProfileMismatchErrorDetails < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::KeyProfileMismatchErrorDetails,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :error_code

        # The External Key is bound to a user profile, and the Workspace does not have
        # that user profile. A Workspace can use only a key bound to its own user profile
        # or a key that isn't bound to one.
        sig { params(error_code: Symbol).returns(T.attached_class) }
        def self.new(error_code: :key_profile_mismatch)
        end

        sig { override.returns({ error_code: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
