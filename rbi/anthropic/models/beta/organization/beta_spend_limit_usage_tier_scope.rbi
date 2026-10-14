# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaSpendLimitUsageTierScope < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaSpendLimitUsageTierScope,
                Anthropic::Internal::AnyHash
              )
            end

          # Scope type. Always `usage_tier` for this scope.
          sig { returns(Symbol) }
          attr_accessor :type

          # Scope of the monthly spend cap Anthropic sets for a Claude Console organization
          # from its usage tier, or a higher cap Anthropic granted the organization.
          # Read-only; its `created_at` and `updated_at` are the organization's creation
          # time, so `amount` can change while `updated_at` stays the same.
          sig { params(type: Symbol).returns(T.attached_class) }
          def self.new(
            # Scope type. Always `usage_tier` for this scope.
            type: :usage_tier
          )
          end

          sig { override.returns({ type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
