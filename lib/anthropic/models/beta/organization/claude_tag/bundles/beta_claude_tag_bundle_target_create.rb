# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeTag
          module Bundles
            module BetaClaudeTagBundleTargetCreate
              extend Anthropic::Internal::Type::Union

              discriminator :type

              # Attach the Bundle to a Slack channel.
              variant :slack_channel,
                      -> { Anthropic::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagSlackChannelBundleTargetCreate }

              # Attach the Bundle to a Slack workspace.
              variant :slack_workspace,
                      -> { Anthropic::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagSlackWorkspaceBundleTargetCreate }

              module Type
                extend Anthropic::Internal::Type::Enum

                SLACK_CHANNEL = :slack_channel
                SLACK_WORKSPACE = :slack_workspace

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # @!method self.variants
              #   @return [Array(Anthropic::Models::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagSlackChannelBundleTargetCreate, Anthropic::Models::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagSlackWorkspaceBundleTargetCreate)]

              # Creates a new instance of the variant class whose `type` matches the given
              # value, passing the remaining arguments to its constructor.
              #
              # Some parameter documentations has been truncated, see
              # {Anthropic::Models::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagBundleTargetCreate}
              # for more details.
              #
              # @param type [Symbol, Anthropic::Models::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagBundleTargetCreate::Type, String]
              #
              # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
              #
              #   @option args [String] :slack_channel_id The identifier of the Slack channel to attach the Bundle to, starting with `slch
              #
              #   @option args [String] :slack_workspace_id The identifier of the Slack workspace to attach the Bundle to, starting with `sl
              #
              # @raise [ArgumentError]
              # @return [Anthropic::Models::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagSlackChannelBundleTargetCreate, Anthropic::Models::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagSlackWorkspaceBundleTargetCreate]
              def self.new(type:, **args)
                case type.to_sym
                when :slack_channel
                  Anthropic::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagSlackChannelBundleTargetCreate.new(**args)
                when :slack_workspace
                  Anthropic::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagSlackWorkspaceBundleTargetCreate.new(
                    **args
                  )
                else
                  raise ArgumentError, "unknown type: #{type}"
                end
              end
            end
          end
        end
      end
    end
  end
end
