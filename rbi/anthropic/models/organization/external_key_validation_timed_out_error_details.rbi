# typed: strong

module Anthropic
  module Models
    module Organization
      class ExternalKeyValidationTimedOutErrorDetails < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::ExternalKeyValidationTimedOutErrorDetails,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :error_code

        # Anthropic's validation of the External Key did not finish in time, so the
        # request was refused. Wait a moment, then send the request again.
        sig { params(error_code: Symbol).returns(T.attached_class) }
        def self.new(error_code: :external_key_validation_timed_out)
        end

        sig { override.returns({ error_code: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
