# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeTag
          module Bundles
            class BetaClaudeTagSlackWorkspaceBundleTargetCreate < Anthropic::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Anthropic::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagSlackWorkspaceBundleTargetCreate,
                    Anthropic::Internal::AnyHash
                  )
                end

              # The identifier of the Slack workspace to attach the Bundle to, starting with
              # `slws_`.
              sig { returns(String) }
              attr_accessor :slack_workspace_id

              sig { returns(Symbol) }
              attr_accessor :type

              # Attach the Bundle to a Slack workspace.
              sig do
                params(slack_workspace_id: String, type: Symbol).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The identifier of the Slack workspace to attach the Bundle to, starting with
                # `slws_`.
                slack_workspace_id:,
                type: :slack_workspace
              )
              end

              sig do
                override.returns({ slack_workspace_id: String, type: Symbol })
              end
              def to_hash
              end
            end
          end
        end
      end
    end
  end
end
