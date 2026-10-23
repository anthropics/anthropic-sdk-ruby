# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeTag
          module Bundles
            class BetaClaudeTagSlackChannelBundleTarget < Anthropic::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Anthropic::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagSlackChannelBundleTarget,
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

              # The identifier of the Slack channel the Bundle is attached to, starting with
              # `slch_`. It is the channel object's `id`, not Slack's `channel_id`.
              sig { returns(String) }
              attr_accessor :slack_channel_id

              sig { returns(Symbol) }
              attr_accessor :type

              # One Bundle attached to one Slack channel. The Bundle can be used in that channel
              # only.
              sig do
                params(
                  id: String,
                  created_at: Time,
                  slack_channel_id: String,
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
                # The identifier of the Slack channel the Bundle is attached to, starting with
                # `slch_`. It is the channel object's `id`, not Slack's `channel_id`.
                slack_channel_id:,
                type: :slack_channel
              )
              end

              sig do
                override.returns(
                  {
                    id: String,
                    created_at: Time,
                    slack_channel_id: String,
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
