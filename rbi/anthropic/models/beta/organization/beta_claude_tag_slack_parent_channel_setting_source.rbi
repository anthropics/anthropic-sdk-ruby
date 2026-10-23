# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaClaudeTagSlackParentChannelSettingSource < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaClaudeTagSlackParentChannelSettingSource,
                Anthropic::Internal::AnyHash
              )
            end

          # The parent channel's identifier, starting with `slch_`.
          sig { returns(String) }
          attr_accessor :slack_channel_id

          sig { returns(Symbol) }
          attr_accessor :type

          # The value comes from the channel that a code channel was started from. A parent
          # channel contributes `instructions` and `environment_id` only.
          sig do
            params(slack_channel_id: String, type: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(
            # The parent channel's identifier, starting with `slch_`.
            slack_channel_id:,
            type: :slack_parent_channel
          )
          end

          sig { override.returns({ slack_channel_id: String, type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
