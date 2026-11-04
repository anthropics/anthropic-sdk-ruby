# typed: strong

module Anthropic
  module Models
    BetaEnvironmentNotFoundErrorDetails =
      Beta::BetaEnvironmentNotFoundErrorDetails

    module Beta
      class BetaEnvironmentNotFoundErrorDetails < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaEnvironmentNotFoundErrorDetails,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :error_code

        # `settings.environment_id` names no Environment within the organization's reach.
        sig { params(error_code: Symbol).returns(T.attached_class) }
        def self.new(error_code: :environment_not_found)
        end

        sig { override.returns({ error_code: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
