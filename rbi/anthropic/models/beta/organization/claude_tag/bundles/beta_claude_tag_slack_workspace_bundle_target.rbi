# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeTag
          module Bundles
            class BetaClaudeTagSlackWorkspaceBundleTarget < Anthropic::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Anthropic::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagSlackWorkspaceBundleTarget,
                    Anthropic::Internal::AnyHash
                  )
                end

              # The Bundle Target's identifier. Starts with `btgt_`. No two Bundle Targets have
              # the same one, and the same Bundle and target always give the same one, also
              # after a detach and a new attach. It is opaque.
              sig { returns(String) }
              attr_accessor :id

              # Time the Bundle was attached.
              sig { returns(Time) }
              attr_accessor :created_at

              # The identifier of the Slack workspace the Bundle is attached to, starting with
              # `slws_`.
              sig { returns(String) }
              attr_accessor :slack_workspace_id

              sig { returns(Symbol) }
              attr_accessor :type

              # One Bundle attached to one Slack workspace. The Bundle can be used in the
              # workspace and in every channel in it.
              sig do
                params(
                  id: String,
                  created_at: Time,
                  slack_workspace_id: String,
                  type: Symbol
                ).returns(T.attached_class)
              end
              def self.new(
                # The Bundle Target's identifier. Starts with `btgt_`. No two Bundle Targets have
                # the same one, and the same Bundle and target always give the same one, also
                # after a detach and a new attach. It is opaque.
                id:,
                # Time the Bundle was attached.
                created_at:,
                # The identifier of the Slack workspace the Bundle is attached to, starting with
                # `slws_`.
                slack_workspace_id:,
                type: :slack_workspace
              )
              end

              sig do
                override.returns(
                  {
                    id: String,
                    created_at: Time,
                    slack_workspace_id: String,
                    type: Symbol
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
end
