# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class SpendLimitDeleteParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::SpendLimitDeleteParams,
                Anthropic::Internal::AnyHash
              )
            end

          # ID of the Spend Limit.
          sig { returns(String) }
          attr_accessor :spend_limit_id

          sig do
            params(
              spend_limit_id: String,
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # ID of the Spend Limit.
            spend_limit_id:,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                spend_limit_id: String,
                request_options: Anthropic::RequestOptions
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
