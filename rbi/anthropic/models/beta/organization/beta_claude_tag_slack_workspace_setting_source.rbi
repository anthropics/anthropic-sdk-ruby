# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaClaudeTagSlackWorkspaceSettingSource < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaClaudeTagSlackWorkspaceSettingSource,
                Anthropic::Internal::AnyHash
              )
            end

          # The workspace's identifier, starting with `slws_`.
          sig { returns(String) }
          attr_accessor :slack_workspace_id

          sig { returns(Symbol) }
          attr_accessor :type

          # The value comes from a Slack workspace of the organization.
          sig do
            params(slack_workspace_id: String, type: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(
            # The workspace's identifier, starting with `slws_`.
            slack_workspace_id:,
            type: :slack_workspace
          )
          end

          sig { override.returns({ slack_workspace_id: String, type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
