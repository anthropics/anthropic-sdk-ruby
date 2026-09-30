# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaSpendLimitSeatTierScope < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaSpendLimitSeatTierScope,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(String) }
          attr_accessor :seat_tier

          sig { returns(Symbol) }
          attr_accessor :type

          sig do
            params(seat_tier: String, type: Symbol).returns(T.attached_class)
          end
          def self.new(seat_tier:, type: :seat_tier)
          end

          sig { override.returns({ seat_tier: String, type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
