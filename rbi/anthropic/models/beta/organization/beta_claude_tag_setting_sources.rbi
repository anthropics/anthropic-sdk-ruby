# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaClaudeTagSettingSources < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaClaudeTagSettingSources,
                Anthropic::Internal::AnyHash
              )
            end

          # The settings level `enabled` comes from.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Organization::BetaClaudeTagSettingSource::Variants
              )
            )
          end
          attr_accessor :enabled

          # The settings level `environment_id` comes from.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Organization::BetaClaudeTagSettingSource::Variants
              )
            )
          end
          attr_accessor :environment_id

          # The settings level `guest_policy` comes from.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Organization::BetaClaudeTagSettingSource::Variants
              )
            )
          end
          attr_accessor :guest_policy

          # Every settings level that contributes text to `instructions`, broadest first, in
          # the order their text is joined. Empty when none does.
          sig do
            returns(
              T::Array[
                Anthropic::Beta::Organization::BetaClaudeTagSettingSource::Variants
              ]
            )
          end
          attr_accessor :instructions

          # The settings level `model` comes from.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Organization::BetaClaudeTagSettingSource::Variants
              )
            )
          end
          attr_accessor :model

          # For each setting, the settings level its value in `settings` comes from. Without
          # `include_inherited`, a setting the channel or workspace stores has a source that
          # names the channel or workspace itself, and one it does not store has null, or an
          # empty list for `instructions`. With `include_inherited=true` no member is null:
          # a value that no settings level sets has the source `default`.
          sig do
            params(
              enabled:
                T.nilable(
                  T.any(
                    Anthropic::Beta::Organization::BetaClaudeTagSlackChannelSettingSource::OrHash,
                    Anthropic::Beta::Organization::BetaClaudeTagSlackWorkspaceSettingSource::OrHash,
                    Anthropic::Beta::Organization::BetaClaudeTagSlackParentChannelSettingSource::OrHash,
                    Anthropic::Beta::Organization::BetaClaudeTagSlackDefaultSettingSource::OrHash,
                    Anthropic::Beta::Organization::BetaClaudeTagDefaultSettingSource::OrHash,
                    Anthropic::Beta::Organization::BetaClaudeTagSlackGridChannelSettingSource::OrHash
                  )
                ),
              environment_id:
                T.nilable(
                  T.any(
                    Anthropic::Beta::Organization::BetaClaudeTagSlackChannelSettingSource::OrHash,
                    Anthropic::Beta::Organization::BetaClaudeTagSlackWorkspaceSettingSource::OrHash,
                    Anthropic::Beta::Organization::BetaClaudeTagSlackParentChannelSettingSource::OrHash,
                    Anthropic::Beta::Organization::BetaClaudeTagSlackDefaultSettingSource::OrHash,
                    Anthropic::Beta::Organization::BetaClaudeTagDefaultSettingSource::OrHash,
                    Anthropic::Beta::Organization::BetaClaudeTagSlackGridChannelSettingSource::OrHash
                  )
                ),
              guest_policy:
                T.nilable(
                  T.any(
                    Anthropic::Beta::Organization::BetaClaudeTagSlackChannelSettingSource::OrHash,
                    Anthropic::Beta::Organization::BetaClaudeTagSlackWorkspaceSettingSource::OrHash,
                    Anthropic::Beta::Organization::BetaClaudeTagSlackParentChannelSettingSource::OrHash,
                    Anthropic::Beta::Organization::BetaClaudeTagSlackDefaultSettingSource::OrHash,
                    Anthropic::Beta::Organization::BetaClaudeTagDefaultSettingSource::OrHash,
                    Anthropic::Beta::Organization::BetaClaudeTagSlackGridChannelSettingSource::OrHash
                  )
                ),
              instructions:
                T::Array[
                  T.any(
                    Anthropic::Beta::Organization::BetaClaudeTagSlackChannelSettingSource::OrHash,
                    Anthropic::Beta::Organization::BetaClaudeTagSlackWorkspaceSettingSource::OrHash,
                    Anthropic::Beta::Organization::BetaClaudeTagSlackParentChannelSettingSource::OrHash,
                    Anthropic::Beta::Organization::BetaClaudeTagSlackDefaultSettingSource::OrHash,
                    Anthropic::Beta::Organization::BetaClaudeTagDefaultSettingSource::OrHash,
                    Anthropic::Beta::Organization::BetaClaudeTagSlackGridChannelSettingSource::OrHash
                  )
                ],
              model:
                T.nilable(
                  T.any(
                    Anthropic::Beta::Organization::BetaClaudeTagSlackChannelSettingSource::OrHash,
                    Anthropic::Beta::Organization::BetaClaudeTagSlackWorkspaceSettingSource::OrHash,
                    Anthropic::Beta::Organization::BetaClaudeTagSlackParentChannelSettingSource::OrHash,
                    Anthropic::Beta::Organization::BetaClaudeTagSlackDefaultSettingSource::OrHash,
                    Anthropic::Beta::Organization::BetaClaudeTagDefaultSettingSource::OrHash,
                    Anthropic::Beta::Organization::BetaClaudeTagSlackGridChannelSettingSource::OrHash
                  )
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # The settings level `enabled` comes from.
            enabled:,
            # The settings level `environment_id` comes from.
            environment_id:,
            # The settings level `guest_policy` comes from.
            guest_policy:,
            # Every settings level that contributes text to `instructions`, broadest first, in
            # the order their text is joined. Empty when none does.
            instructions:,
            # The settings level `model` comes from.
            model:
          )
          end

          sig do
            override.returns(
              {
                enabled:
                  T.nilable(
                    Anthropic::Beta::Organization::BetaClaudeTagSettingSource::Variants
                  ),
                environment_id:
                  T.nilable(
                    Anthropic::Beta::Organization::BetaClaudeTagSettingSource::Variants
                  ),
                guest_policy:
                  T.nilable(
                    Anthropic::Beta::Organization::BetaClaudeTagSettingSource::Variants
                  ),
                instructions:
                  T::Array[
                    Anthropic::Beta::Organization::BetaClaudeTagSettingSource::Variants
                  ],
                model:
                  T.nilable(
                    Anthropic::Beta::Organization::BetaClaudeTagSettingSource::Variants
                  )
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
