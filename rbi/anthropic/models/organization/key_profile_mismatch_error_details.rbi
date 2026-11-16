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

        # After this request, the External Key and the Workspace would not have the same
        # user profile. A key and its Workspace must have the same user profile, or both
        # have none.
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
