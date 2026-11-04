# typed: strong

module Anthropic
  module Models
    BetaEnvironmentCreateDisabledErrorDetails =
      Beta::BetaEnvironmentCreateDisabledErrorDetails

    module Beta
      class BetaEnvironmentCreateDisabledErrorDetails < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaEnvironmentCreateDisabledErrorDetails,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :error_code

        # Anthropic has turned off creating environments for this organization. Existing
        # environments still work.
        sig { params(error_code: Symbol).returns(T.attached_class) }
        def self.new(error_code: :environment_create_disabled)
        end

        sig { override.returns({ error_code: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
