# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class RBACGroupCreateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::RBACGroupCreateParams,
                Anthropic::Internal::AnyHash
              )
            end

          # Name of the RBAC Group. Not uniqueness-enforced.
          sig { returns(String) }
          attr_accessor :name

          sig do
            params(
              name: String,
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Name of the RBAC Group. Not uniqueness-enforced.
            name:,
            request_options: {}
          )
          end

          sig do
            override.returns(
              { name: String, request_options: Anthropic::RequestOptions }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
