# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeTag
          module Bundles
            # One Bundle attached to one Slack channel or one Slack workspace. More types of
            # target can be added.
            #
            # @see Anthropic::Resources::Beta::Organization::ClaudeTag::Bundles::Targets#create
            module BetaClaudeTagBundleTarget
              extend Anthropic::Internal::Type::Union

              discriminator :type

              # One Bundle attached to one Slack channel. The Bundle can be used in that channel only.
              variant :slack_channel,
                      -> { Anthropic::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagSlackChannelBundleTarget }

              # One Bundle attached to one Slack workspace. The Bundle can be used in the workspace and in every channel in it.
              variant :slack_workspace,
                      -> { Anthropic::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagSlackWorkspaceBundleTarget }

              module Type
                extend Anthropic::Internal::Type::Enum

                SLACK_CHANNEL = :slack_channel
                SLACK_WORKSPACE = :slack_workspace

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # @!method self.variants
              #   @return [Array(Anthropic::Models::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagSlackChannelBundleTarget, Anthropic::Models::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagSlackWorkspaceBundleTarget)]

              # Creates a new instance of the variant class whose `type` matches the given
              # value, passing the remaining arguments to its constructor.
              #
              # Some parameter documentations has been truncated, see
              # {Anthropic::Models::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagBundleTarget}
              # for more details.
              #
              # @param type [Symbol, Anthropic::Models::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagBundleTarget::Type, String]
              #
              # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
              #
              #   @option args [String] :id The Bundle Target's identifier. Starts with `btgt_`. No two Bundle Targets have
              #
              #   @option args [Time] :created_at Time the Bundle was attached.
              #
              #   @option args [String] :slack_channel_id The identifier of the Slack channel the Bundle is attached to, starting with `sl
              #
              #   @option args [String] :slack_workspace_id The identifier of the Slack workspace the Bundle is attached to, starting with `
              #
              # @raise [ArgumentError]
              # @return [Anthropic::Models::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagSlackChannelBundleTarget, Anthropic::Models::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagSlackWorkspaceBundleTarget]
              def self.new(type:, **args)
                case type.to_sym
                when :slack_channel
                  Anthropic::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagSlackChannelBundleTarget.new(**args)
                when :slack_workspace
                  Anthropic::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagSlackWorkspaceBundleTarget.new(**args)
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
