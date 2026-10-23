# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeTag
          class BetaClaudeTagSlackChannel < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::ClaudeTag::BetaClaudeTagSlackChannel,
                  Anthropic::Internal::AnyHash
                )
              end

            # The channel's identifier. Starts with `slch_`. It does not change for as long as
            # the channel is set up, with one exception: a channel that is not configured gets
            # a new one when claude.ai replaces its record, which happens only while the
            # organization's read-only mode is off. A channel that is removed and set up again
            # also has a new one. The old one keeps returning 404; look the channel up by its
            # Slack identifiers for the new one.
            sig { returns(String) }
            attr_accessor :id

            # Time the channel was set up, by whichever route. It does not change for as long
            # as `id` does not.
            sig { returns(Time) }
            attr_accessor :created_at

            # What the channel itself stores or, with `include_inherited`, what applies in it.
            # `sources` says which.
            sig do
              returns(Anthropic::Beta::Organization::BetaClaudeTagSettings)
            end
            attr_reader :settings

            sig do
              params(
                settings:
                  Anthropic::Beta::Organization::BetaClaudeTagSettings::OrHash
              ).void
            end
            attr_writer :settings

            # Slack's own identifiers for the channel.
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

            # For each setting, the settings level its value in `settings` comes from.
            sig do
              returns(
                Anthropic::Beta::Organization::BetaClaudeTagSettingSources
              )
            end
            attr_reader :sources

            sig do
              params(
                sources:
                  Anthropic::Beta::Organization::BetaClaudeTagSettingSources::OrHash
              ).void
            end
            attr_writer :sources

            sig { returns(Symbol) }
            attr_accessor :type

            # Time Claude Tag's record of the channel last changed. It moves on every change
            # to a setting, and can also move when something no response holds changes, so a
            # later value says to read the channel again, not that a setting changed.
            # Attaching or detaching a Bundle does not by itself move it.
            sig { returns(Time) }
            attr_accessor :updated_at

            # A Slack channel set up for Claude Tag, with the settings it stores or, with
            # `include_inherited`, the settings that apply in it.
            sig do
              params(
                id: String,
                created_at: Time,
                settings:
                  Anthropic::Beta::Organization::BetaClaudeTagSettings::OrHash,
                slack:
                  Anthropic::Beta::Organization::BetaClaudeTagSlackChannelIdentifiers::OrHash,
                sources:
                  Anthropic::Beta::Organization::BetaClaudeTagSettingSources::OrHash,
                updated_at: Time,
                type: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              # The channel's identifier. Starts with `slch_`. It does not change for as long as
              # the channel is set up, with one exception: a channel that is not configured gets
              # a new one when claude.ai replaces its record, which happens only while the
              # organization's read-only mode is off. A channel that is removed and set up again
              # also has a new one. The old one keeps returning 404; look the channel up by its
              # Slack identifiers for the new one.
              id:,
              # Time the channel was set up, by whichever route. It does not change for as long
              # as `id` does not.
              created_at:,
              # What the channel itself stores or, with `include_inherited`, what applies in it.
              # `sources` says which.
              settings:,
              # Slack's own identifiers for the channel.
              slack:,
              # For each setting, the settings level its value in `settings` comes from.
              sources:,
              # Time Claude Tag's record of the channel last changed. It moves on every change
              # to a setting, and can also move when something no response holds changes, so a
              # later value says to read the channel again, not that a setting changed.
              # Attaching or detaching a Bundle does not by itself move it.
              updated_at:,
              type: :slack_channel
            )
            end

            sig do
              override.returns(
                {
                  id: String,
                  created_at: Time,
                  settings:
                    Anthropic::Beta::Organization::BetaClaudeTagSettings,
                  slack:
                    Anthropic::Beta::Organization::BetaClaudeTagSlackChannelIdentifiers,
                  sources:
                    Anthropic::Beta::Organization::BetaClaudeTagSettingSources,
                  type: Symbol,
                  updated_at: Time
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
