# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module RBACGroups
          class MemberRemoveParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::RBACGroups::MemberRemoveParams,
                  Anthropic::Internal::AnyHash
                )
              end

            # ID of the RBAC Group.
            sig { returns(String) }
            attr_accessor :rbac_group_id

            # ID of the User.
            sig { returns(String) }
            attr_accessor :user_id

            sig do
              params(
                rbac_group_id: String,
                user_id: String,
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # ID of the RBAC Group.
              rbac_group_id:,
              # ID of the User.
              user_id:,
              request_options: {}
            )
            end

            sig do
              override.returns(
                {
                  rbac_group_id: String,
                  user_id: String,
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
