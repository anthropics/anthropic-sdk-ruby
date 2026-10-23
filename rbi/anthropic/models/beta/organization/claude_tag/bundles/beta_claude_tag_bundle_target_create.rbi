# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeTag
          module Bundles
            module BetaClaudeTagBundleTargetCreate
              extend Anthropic::Internal::Type::Union

              Variants =
                T.type_alias do
                  T.any(
                    Anthropic::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagSlackChannelBundleTargetCreate,
                    Anthropic::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagSlackWorkspaceBundleTargetCreate
                  )
                end

              module Type
                extend Anthropic::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Anthropic::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagBundleTargetCreate::Type
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                SLACK_CHANNEL =
                  T.let(
                    :slack_channel,
                    Anthropic::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagBundleTargetCreate::Type::TaggedSymbol
                  )
                SLACK_WORKSPACE =
                  T.let(
                    :slack_workspace,
                    Anthropic::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagBundleTargetCreate::Type::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Anthropic::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagBundleTargetCreate::Type::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagBundleTargetCreate::Variants
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
                    Anthropic::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagBundleTargetCreate::Type::OrSymbol,
                  slack_channel_id: String,
                  slack_workspace_id: String
                ).returns(
                  Anthropic::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagBundleTargetCreate::Variants
                )
              end
              def self.new(
                type:,
                # The identifier of the Slack channel to attach the Bundle to, starting with
                # `slch_`. It is the channel object's `id`, not Slack's `channel_id`.
                slack_channel_id: nil,
                # The identifier of the Slack workspace to attach the Bundle to, starting with
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
