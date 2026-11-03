# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaEnvironmentNotFoundErrorDetails < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaEnvironmentNotFoundErrorDetails,
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
end
