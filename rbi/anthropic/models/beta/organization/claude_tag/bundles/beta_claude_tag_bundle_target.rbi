# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeTag
          module Bundles
            # One Bundle attached to one Slack channel or one Slack workspace. More types of
            # target can be added.
            module BetaClaudeTagBundleTarget
              extend Anthropic::Internal::Type::Union

              Variants =
                T.type_alias do
                  T.any(
                    Anthropic::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagSlackChannelBundleTarget,
                    Anthropic::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagSlackWorkspaceBundleTarget
                  )
                end

              module Type
                extend Anthropic::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Anthropic::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagBundleTarget::Type
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                SLACK_CHANNEL =
                  T.let(
                    :slack_channel,
                    Anthropic::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagBundleTarget::Type::TaggedSymbol
                  )
                SLACK_WORKSPACE =
                  T.let(
                    :slack_workspace,
                    Anthropic::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagBundleTarget::Type::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Anthropic::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagBundleTarget::Type::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagBundleTarget::Variants
                  ]
                )
              end
              def self.variants
              end

              # Creates a new instance of the variant class whose `type` matches the given
              # value, passing the remaining arguments to its constructor.
              sig do
                params(
                  type:
                    Anthropic::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagBundleTarget::Type::OrSymbol,
                  id: String,
                  created_at: Time,
                  slack_channel_id: String,
                  slack_workspace_id: String
                ).returns(
                  Anthropic::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagBundleTarget::Variants
                )
              end
              def self.new(
                type:,
                # The Bundle Target's identifier. Starts with `btgt_`. No two Bundle Targets have
                # the same one, and the same Bundle and target always give the same one, also
                # after a detach and a new attach. It is opaque.
                id:,
                # Time the Bundle was attached.
                created_at:,
                # The identifier of the Slack channel the Bundle is attached to, starting with
                # `slch_`. It is the channel object's `id`, not Slack's `channel_id`.
                slack_channel_id: nil,
                # The identifier of the Slack workspace the Bundle is attached to, starting with
                # `slws_`.
                slack_workspace_id: nil
              )
              end
            end
          end
        end
      end
    end
  end
end
