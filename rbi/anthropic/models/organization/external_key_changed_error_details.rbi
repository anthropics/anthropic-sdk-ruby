# typed: strong

module Anthropic
  module Models
    module Organization
      class ExternalKeyChangedErrorDetails < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::ExternalKeyChangedErrorDetails,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :error_code

        # The external key changed while the request was validating it. Send the request
        # again.
        sig { params(error_code: Symbol).returns(T.attached_class) }
        def self.new(error_code: :external_key_changed)
        end

        sig { override.returns({ error_code: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
