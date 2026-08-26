# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Workspaces
          class MemberRemoveParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::Workspaces::MemberRemoveParams,
                  Anthropic::Internal::AnyHash
                )
              end

            # ID of the Workspace.
            sig { returns(String) }
            attr_accessor :workspace_id

            # ID of the User.
            sig { returns(String) }
            attr_accessor :user_id

            sig do
              params(
                workspace_id: String,
                user_id: String,
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # ID of the Workspace.
              workspace_id:,
              # ID of the User.
              user_id:,
              request_options: {}
            )
            end

            sig do
              override.returns(
                {
                  workspace_id: String,
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
