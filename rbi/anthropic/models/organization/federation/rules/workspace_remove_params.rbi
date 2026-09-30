# typed: strong

module Anthropic
  module Models
    module Organization
      module Federation
        module Rules
          class WorkspaceRemoveParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Organization::Federation::Rules::WorkspaceRemoveParams,
                  Anthropic::Internal::AnyHash
                )
              end

            # ID of the federation rule.
            sig { returns(String) }
            attr_accessor :federation_rule_id

            # ID of the workspace to disable for.
            sig { returns(String) }
            attr_accessor :workspace_id

            sig do
              params(
                federation_rule_id: String,
                workspace_id: String,
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # ID of the federation rule.
              federation_rule_id:,
              # ID of the workspace to disable for.
              workspace_id:,
              request_options: {}
            )
            end

            sig do
              override.returns(
                {
                  federation_rule_id: String,
                  workspace_id: String,
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
