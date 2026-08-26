# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaOrganizationRateLimitValue < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaOrganizationRateLimitValue,
                Anthropic::Internal::AnyHash
              )
            end

          # The limiter type (for example, `requests_per_minute` or
          # `input_tokens_per_minute`).
          sig { returns(String) }
          attr_accessor :type

          # The configured limit value for this limiter type.
          sig { returns(Integer) }
          attr_accessor :value

          sig { params(type: String, value: Integer).returns(T.attached_class) }
          def self.new(
            # The limiter type (for example, `requests_per_minute` or
            # `input_tokens_per_minute`).
            type:,
            # The configured limit value for this limiter type.
            value:
          )
          end

          sig { override.returns({ type: String, value: Integer }) }
          def to_hash
          end
        end
      end
    end
  end
end
