# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaClaudeTagSlackChannelIdentifiers < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaClaudeTagSlackChannelIdentifiers,
                Anthropic::Internal::AnyHash
              )
            end

          # Slack's identifier for the channel, starting with `C` or `G`, such as
          # `C0456EFGH`.
          sig { returns(String) }
          attr_accessor :channel_id

          # Slack's identifier for the workspace the channel is in, starting with `T`, such
          # as `T0123ABCD`.
          sig { returns(String) }
          attr_accessor :workspace_id

          # The identifiers Slack shows for a channel. They are Slack's own, not identifiers
          # of this API.
          sig do
            params(channel_id: String, workspace_id: String).returns(
              T.attached_class
            )
          end
          def self.new(
            # Slack's identifier for the channel, starting with `C` or `G`, such as
            # `C0456EFGH`.
            channel_id:,
            # Slack's identifier for the workspace the channel is in, starting with `T`, such
            # as `T0123ABCD`.
            workspace_id:
          )
          end

          sig { override.returns({ channel_id: String, workspace_id: String }) }
          def to_hash
          end
        end
      end
    end
  end
end
