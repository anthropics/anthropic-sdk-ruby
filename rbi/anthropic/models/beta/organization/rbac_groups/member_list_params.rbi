# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module RBACGroups
          class MemberListParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::RBACGroups::MemberListParams,
                  Anthropic::Internal::AnyHash
                )
              end

            # ID of the RBAC Group.
            sig { returns(String) }
            attr_accessor :rbac_group_id

            # Number of items to return per page.
            #
            # Defaults to `20`. Ranges from `1` to `1000`.
            sig { returns(T.nilable(Integer)) }
            attr_reader :limit

            sig { params(limit: Integer).void }
            attr_writer :limit

            # Optionally set to the `next_page` token from the previous response.
            sig { returns(T.nilable(String)) }
            attr_accessor :page

            sig do
              params(
                rbac_group_id: String,
                limit: Integer,
                page: T.nilable(String),
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # ID of the RBAC Group.
              rbac_group_id:,
              # Number of items to return per page.
              #
              # Defaults to `20`. Ranges from `1` to `1000`.
              limit: nil,
              # Optionally set to the `next_page` token from the previous response.
              page: nil,
              request_options: {}
            )
            end

            sig do
              override.returns(
                {
                  rbac_group_id: String,
                  limit: Integer,
                  page: T.nilable(String),
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
