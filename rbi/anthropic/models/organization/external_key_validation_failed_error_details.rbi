# typed: strong

module Anthropic
  module Models
    module Organization
      class ExternalKeyValidationFailedErrorDetails < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::ExternalKeyValidationFailedErrorDetails,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :error_code

        # The External Key failed Anthropic's validation, so the request was refused. The
        # message gives the reason, if there is one.
        sig { params(error_code: Symbol).returns(T.attached_class) }
        def self.new(error_code: :external_key_validation_failed)
        end

        sig { override.returns({ error_code: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
