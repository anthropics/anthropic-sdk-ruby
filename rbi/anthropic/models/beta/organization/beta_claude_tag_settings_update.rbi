# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaClaudeTagSettingsUpdate < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaClaudeTagSettingsUpdate,
                Anthropic::Internal::AnyHash
              )
            end

          # Whether Claude is on. `true` on a channel turns Claude on in it even when its
          # workspace stores `false`. Null clears it.
          sig { returns(T.nilable(T::Boolean)) }
          attr_accessor :enabled

          # The environment Claude's sessions run in: the identifier of an active
          # environment of the organization, starting with `env_`, or of a self-hosted
          # runner pool of the organization that every member may use, starting with
          # `ccpool_`. Null clears it.
          sig { returns(T.nilable(String)) }
          attr_accessor :environment_id

          # What Claude does in a channel while a Slack guest is in it. Null clears it.
          sig do
            returns(
              T.nilable(
                T.any(
                  Anthropic::Beta::Organization::BetaClaudeTagGuestPolicyAllow,
                  Anthropic::Beta::Organization::BetaClaudeTagGuestPolicyRestrict,
                  Anthropic::Beta::Organization::BetaClaudeTagGuestPolicyChannelOnly
                )
              )
            )
          end
          attr_accessor :guest_policy

          # Instructions for Claude, up to 8,192 characters after leading and trailing white
          # space is trimmed. Null or blank text clears them.
          sig { returns(T.nilable(String)) }
          attr_accessor :instructions

          # The model Claude uses: the identifier of a model, or the name of a model line,
          # that the organization is entitled to for Claude Tag. Null clears it.
          sig { returns(T.nilable(String)) }
          attr_accessor :model

          # How Claude takes part in the channel: `automatic`, `mention_only`,
          # `always_awake` or `thread`. Only a channel takes one: an update of a workspace
          # that sends a value is refused, and one that sends null changes nothing. Null
          # never clears it: sent to a channel that stores none it changes nothing, and sent
          # to a channel that stores one it is refused, because a stored reply mode can be
          # changed but never cleared; a caller that wants Claude's default behavior sends
          # `automatic`.
          sig do
            returns(
              T.nilable(
                T.any(
                  Anthropic::Beta::Organization::BetaClaudeTagReplyModeAutomatic,
                  Anthropic::Beta::Organization::BetaClaudeTagReplyModeMentionOnly,
                  Anthropic::Beta::Organization::BetaClaudeTagReplyModeAlwaysAwake,
                  Anthropic::Beta::Organization::BetaClaudeTagReplyModeThread
                )
              )
            )
          end
          attr_accessor :reply_mode

          # The settings to change. A setting left out is unchanged. A setting sent as null
          # is cleared, so it is inherited.
          sig do
            params(
              enabled: T.nilable(T::Boolean),
              environment_id: T.nilable(String),
              guest_policy:
                T.nilable(
                  T.any(
                    Anthropic::Beta::Organization::BetaClaudeTagGuestPolicyAllow::OrHash,
                    Anthropic::Beta::Organization::BetaClaudeTagGuestPolicyRestrict::OrHash,
                    Anthropic::Beta::Organization::BetaClaudeTagGuestPolicyChannelOnly::OrHash
                  )
                ),
              instructions: T.nilable(String),
              model: T.nilable(String),
              reply_mode:
                T.nilable(
                  T.any(
                    Anthropic::Beta::Organization::BetaClaudeTagReplyModeAutomatic::OrHash,
                    Anthropic::Beta::Organization::BetaClaudeTagReplyModeMentionOnly::OrHash,
                    Anthropic::Beta::Organization::BetaClaudeTagReplyModeAlwaysAwake::OrHash,
                    Anthropic::Beta::Organization::BetaClaudeTagReplyModeThread::OrHash
                  )
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # Whether Claude is on. `true` on a channel turns Claude on in it even when its
            # workspace stores `false`. Null clears it.
            enabled: nil,
            # The environment Claude's sessions run in: the identifier of an active
            # environment of the organization, starting with `env_`, or of a self-hosted
            # runner pool of the organization that every member may use, starting with
            # `ccpool_`. Null clears it.
            environment_id: nil,
            # What Claude does in a channel while a Slack guest is in it. Null clears it.
            guest_policy: nil,
            # Instructions for Claude, up to 8,192 characters after leading and trailing white
            # space is trimmed. Null or blank text clears them.
            instructions: nil,
            # The model Claude uses: the identifier of a model, or the name of a model line,
            # that the organization is entitled to for Claude Tag. Null clears it.
            model: nil,
            # How Claude takes part in the channel: `automatic`, `mention_only`,
            # `always_awake` or `thread`. Only a channel takes one: an update of a workspace
            # that sends a value is refused, and one that sends null changes nothing. Null
            # never clears it: sent to a channel that stores none it changes nothing, and sent
            # to a channel that stores one it is refused, because a stored reply mode can be
            # changed but never cleared; a caller that wants Claude's default behavior sends
            # `automatic`.
            reply_mode: nil
          )
          end

          sig do
            override.returns(
              {
                enabled: T.nilable(T::Boolean),
                environment_id: T.nilable(String),
                guest_policy:
                  T.nilable(
                    T.any(
                      Anthropic::Beta::Organization::BetaClaudeTagGuestPolicyAllow,
                      Anthropic::Beta::Organization::BetaClaudeTagGuestPolicyRestrict,
                      Anthropic::Beta::Organization::BetaClaudeTagGuestPolicyChannelOnly
                    )
                  ),
                instructions: T.nilable(String),
                model: T.nilable(String),
                reply_mode:
                  T.nilable(
                    T.any(
                      Anthropic::Beta::Organization::BetaClaudeTagReplyModeAutomatic,
                      Anthropic::Beta::Organization::BetaClaudeTagReplyModeMentionOnly,
                      Anthropic::Beta::Organization::BetaClaudeTagReplyModeAlwaysAwake,
                      Anthropic::Beta::Organization::BetaClaudeTagReplyModeThread
                    )
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
