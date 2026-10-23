# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # What Claude does in a channel while a Slack guest is in it, for everyone in the
        # channel. It changes nothing in a channel without Slack guests. More types can be
        # added.
        module BetaClaudeTagGuestPolicy
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # Claude answers in the channel.
          variant :allow, -> { Anthropic::Beta::Organization::BetaClaudeTagGuestPolicyAllow }

          # Claude does not answer in the channel.
          variant :restrict, -> { Anthropic::Beta::Organization::BetaClaudeTagGuestPolicyRestrict }

          # Claude answers with only the Bundles attached to the channel itself.
          variant :channel_only, -> { Anthropic::Beta::Organization::BetaClaudeTagGuestPolicyChannelOnly }

          module Type
            extend Anthropic::Internal::Type::Enum

            ALLOW = :allow
            RESTRICT = :restrict
            CHANNEL_ONLY = :channel_only

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::Organization::BetaClaudeTagGuestPolicyAllow, Anthropic::Models::Beta::Organization::BetaClaudeTagGuestPolicyRestrict, Anthropic::Models::Beta::Organization::BetaClaudeTagGuestPolicyChannelOnly)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # @param type [Symbol, Anthropic::Models::Beta::Organization::BetaClaudeTagGuestPolicy::Type, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::Organization::BetaClaudeTagGuestPolicyAllow, Anthropic::Models::Beta::Organization::BetaClaudeTagGuestPolicyRestrict, Anthropic::Models::Beta::Organization::BetaClaudeTagGuestPolicyChannelOnly]
          def self.new(type:, **args)
            case type.to_sym
            when :allow
              Anthropic::Beta::Organization::BetaClaudeTagGuestPolicyAllow.new(**args)
            when :restrict
              Anthropic::Beta::Organization::BetaClaudeTagGuestPolicyRestrict.new(**args)
            when :channel_only
              Anthropic::Beta::Organization::BetaClaudeTagGuestPolicyChannelOnly.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end
      end
    end
  end
end
