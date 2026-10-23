# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeTag
          class BetaClaudeTagSlackWorkspace < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::ClaudeTag::BetaClaudeTagSlackWorkspace,
                  Anthropic::Internal::AnyHash
                )
              end

            # The workspace's identifier. Starts with `slws_`. It does not change for as long
            # as the workspace is set up. A workspace that is removed and set up again has a
            # new one, and the old one keeps returning 404; look the workspace up by its Slack
            # identifier for the new one.
            sig { returns(String) }
            attr_accessor :id

            # Time the workspace was set up, by whichever route. It does not change for as
            # long as `id` does not.
            sig { returns(Time) }
            attr_accessor :created_at

            # What the workspace itself stores or, with `include_inherited`, what applies in
            # it. `sources` says which.
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

            # Slack's own identifier for the workspace.
            sig do
              returns(
                Anthropic::Beta::Organization::BetaClaudeTagSlackWorkspaceIdentifiers
              )
            end
            attr_reader :slack

            sig do
              params(
                slack:
                  Anthropic::Beta::Organization::BetaClaudeTagSlackWorkspaceIdentifiers::OrHash
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

            # Time Claude Tag's record of the workspace last changed. It moves on every change
            # to a setting, and can also move when something no response holds changes, so a
            # later value says to read the workspace again, not that a setting changed.
            # Attaching or detaching a Bundle does not by itself move it.
            sig { returns(Time) }
            attr_accessor :updated_at

            # A Slack workspace the organization has connected, itself or through its Slack
            # Enterprise Grid, with the settings it stores or, with `include_inherited`, the
            # settings that apply in it.
            sig do
              params(
                id: String,
                created_at: Time,
                settings:
                  Anthropic::Beta::Organization::BetaClaudeTagSettings::OrHash,
                slack:
                  Anthropic::Beta::Organization::BetaClaudeTagSlackWorkspaceIdentifiers::OrHash,
                sources:
                  Anthropic::Beta::Organization::BetaClaudeTagSettingSources::OrHash,
                updated_at: Time,
                type: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              # The workspace's identifier. Starts with `slws_`. It does not change for as long
              # as the workspace is set up. A workspace that is removed and set up again has a
              # new one, and the old one keeps returning 404; look the workspace up by its Slack
              # identifier for the new one.
              id:,
              # Time the workspace was set up, by whichever route. It does not change for as
              # long as `id` does not.
              created_at:,
              # What the workspace itself stores or, with `include_inherited`, what applies in
              # it. `sources` says which.
              settings:,
              # Slack's own identifier for the workspace.
              slack:,
              # For each setting, the settings level its value in `settings` comes from.
              sources:,
              # Time Claude Tag's record of the workspace last changed. It moves on every change
              # to a setting, and can also move when something no response holds changes, so a
              # later value says to read the workspace again, not that a setting changed.
              # Attaching or detaching a Bundle does not by itself move it.
              updated_at:,
              type: :slack_workspace
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
                    Anthropic::Beta::Organization::BetaClaudeTagSlackWorkspaceIdentifiers,
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
