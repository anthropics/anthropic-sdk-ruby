# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeTag
          module Bundles
            class BetaClaudeTagSlackChannelBundleTargetCreate < Anthropic::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Anthropic::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagSlackChannelBundleTargetCreate,
                    Anthropic::Internal::AnyHash
                  )
                end

              # The identifier of the Slack channel to attach the Bundle to, starting with
              # `slch_`. It is the channel object's `id`, not Slack's `channel_id`.
              sig { returns(String) }
              attr_accessor :slack_channel_id

              sig { returns(Symbol) }
              attr_accessor :type

              # Attach the Bundle to a Slack channel.
              sig do
                params(slack_channel_id: String, type: Symbol).returns(
                  T.attached_class
                )
              end
              def self.new(
                # The identifier of the Slack channel to attach the Bundle to, starting with
                # `slch_`. It is the channel object's `id`, not Slack's `channel_id`.
                slack_channel_id:,
                type: :slack_channel
              )
              end

              sig do
                override.returns({ slack_channel_id: String, type: Symbol })
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
