# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class RBACGroupUpdateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::RBACGroupUpdateParams,
                Anthropic::Internal::AnyHash
              )
            end

          # ID of the RBAC Group.
          sig { returns(String) }
          attr_accessor :rbac_group_id

          # Name of the RBAC Group. Not uniqueness-enforced.
          sig { returns(T.nilable(String)) }
          attr_accessor :name

          sig do
            params(
              rbac_group_id: String,
              name: T.nilable(String),
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # ID of the RBAC Group.
            rbac_group_id:,
            # Name of the RBAC Group. Not uniqueness-enforced.
            name: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                rbac_group_id: String,
                name: T.nilable(String),
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
