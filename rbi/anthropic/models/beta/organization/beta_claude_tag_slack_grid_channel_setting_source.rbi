# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaClaudeTagSlackGridChannelSettingSource < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaClaudeTagSlackGridChannelSettingSource,
                Anthropic::Internal::AnyHash
              )
            end

          # Slack's own identifiers for the channel under that other workspace.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaClaudeTagSlackChannelIdentifiers
            )
          end
          attr_reader :slack

          sig do
            params(
              slack:
                Anthropic::Beta::Organization::BetaClaudeTagSlackChannelIdentifiers::OrHash
            ).void
          end
          attr_writer :slack

          sig { returns(Symbol) }
          attr_accessor :type

          # The value comes from the addressed channel as it is set up under another
          # workspace of its Enterprise Grid: a channel shared across the Grid keeps one
          # Slack channel identifier in every workspace that sees it.
          sig do
            params(
              slack:
                Anthropic::Beta::Organization::BetaClaudeTagSlackChannelIdentifiers::OrHash,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Slack's own identifiers for the channel under that other workspace.
            slack:,
            type: :slack_grid_channel
          )
          end

          sig do
            override.returns(
              {
                slack:
                  Anthropic::Beta::Organization::BetaClaudeTagSlackChannelIdentifiers,
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
