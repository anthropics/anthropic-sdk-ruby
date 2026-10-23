# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaClaudeTagSlackChannelSettingSource < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaClaudeTagSlackChannelSettingSource,
                Anthropic::Internal::AnyHash
              )
            end

          # The channel's identifier, starting with `slch_`.
          sig { returns(String) }
          attr_accessor :slack_channel_id

          sig { returns(Symbol) }
          attr_accessor :type

          # The value comes from the addressed Slack channel itself.
          sig do
            params(slack_channel_id: String, type: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(
            # The channel's identifier, starting with `slch_`.
            slack_channel_id:,
            type: :slack_channel
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
