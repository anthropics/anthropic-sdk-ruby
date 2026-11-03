# typed: strong

module Anthropic
  module Models
    BetaEnvironmentUpdateDisabledErrorDetails =
      Beta::BetaEnvironmentUpdateDisabledErrorDetails

    module Beta
      class BetaEnvironmentUpdateDisabledErrorDetails < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaEnvironmentUpdateDisabledErrorDetails,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :error_code

        # Anthropic has turned off updating environments for this organization. Existing
        # environments still work as they are.
        sig { params(error_code: Symbol).returns(T.attached_class) }
        def self.new(error_code: :environment_update_disabled)
        end

        sig { override.returns({ error_code: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
