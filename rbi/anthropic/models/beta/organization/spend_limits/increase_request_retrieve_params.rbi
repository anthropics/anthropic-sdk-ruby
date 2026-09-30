# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module SpendLimits
          class IncreaseRequestRetrieveParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::SpendLimits::IncreaseRequestRetrieveParams,
                  Anthropic::Internal::AnyHash
                )
              end

            # ID of the spend limit increase request.
            sig { returns(String) }
            attr_accessor :spend_limit_increase_request_id

            sig do
              params(
                spend_limit_increase_request_id: String,
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # ID of the spend limit increase request.
              spend_limit_increase_request_id:,
              request_options: {}
            )
            end

            sig do
              override.returns(
                {
                  spend_limit_increase_request_id: String,
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
end
