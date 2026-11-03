# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaSpendLimitsAdminAPIWritesNotEnabledErrorDetails < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaSpendLimitsAdminAPIWritesNotEnabledErrorDetails,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :error_code

          # The organization cannot retrieve, set or delete spend limits with an Admin API
          # credential.
          sig { params(error_code: Symbol).returns(T.attached_class) }
          def self.new(error_code: :spend_limits_admin_api_writes_not_enabled)
          end

          sig { override.returns({ error_code: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
