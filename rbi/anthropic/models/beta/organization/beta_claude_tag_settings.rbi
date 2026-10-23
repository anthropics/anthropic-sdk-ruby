# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaClaudeTagSettings < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaClaudeTagSettings,
                Anthropic::Internal::AnyHash
              )
            end

          # Whether Claude is on. The nearest settings level that sets it decides.
          sig { returns(T.nilable(T::Boolean)) }
          attr_accessor :enabled

          # The environment Claude's sessions run in, starting with `env_`, or the
          # identifier of a self-hosted runner pool, starting with `ccpool_`. The nearest
          # settings level that sets it decides.
          sig { returns(T.nilable(String)) }
          attr_accessor :environment_id

          # What Claude does in a channel while a Slack guest is in it. The nearest settings
          # level that sets it decides.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Organization::BetaClaudeTagGuestPolicy::Variants
              )
            )
          end
          attr_accessor :guest_policy

          # Instructions for Claude. Instructions add up: the text of every settings level
          # that sets it is joined, broadest first.
          sig { returns(T.nilable(String)) }
          attr_accessor :instructions

          # The model Claude uses: a model identifier or the name of a model line. The
          # nearest settings level that sets it decides. When none does, Claude uses the
          # product's default model.
          sig { returns(T.nilable(String)) }
          attr_accessor :model

          # Claude Tag settings. Without `include_inherited`, a setting that is null is not
          # set on the settings level and is inherited. With it, `enabled` and
          # `guest_policy` are never null, and `instructions`, `model` and `environment_id`
          # are null when no settings level sets them.
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
              model: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            # Whether Claude is on. The nearest settings level that sets it decides.
            enabled:,
            # The environment Claude's sessions run in, starting with `env_`, or the
            # identifier of a self-hosted runner pool, starting with `ccpool_`. The nearest
            # settings level that sets it decides.
            environment_id:,
            # What Claude does in a channel while a Slack guest is in it. The nearest settings
            # level that sets it decides.
            guest_policy:,
            # Instructions for Claude. Instructions add up: the text of every settings level
            # that sets it is joined, broadest first.
            instructions:,
            # The model Claude uses: a model identifier or the name of a model line. The
            # nearest settings level that sets it decides. When none does, Claude uses the
            # product's default model.
            model:
          )
          end

          sig do
            override.returns(
              {
                enabled: T.nilable(T::Boolean),
                environment_id: T.nilable(String),
                guest_policy:
                  T.nilable(
                    Anthropic::Beta::Organization::BetaClaudeTagGuestPolicy::Variants
                  ),
                instructions: T.nilable(String),
                model: T.nilable(String)
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
