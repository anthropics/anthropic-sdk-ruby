# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # How Claude takes part in a Slack channel. A channel alone stores one. More types
        # can be added.
        module BetaClaudeTagReplyMode
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # Claude reads along and joins in when it can help, and pauses on its own in quiet or busy channels.
          variant :automatic, -> { Anthropic::Beta::Organization::BetaClaudeTagReplyModeAutomatic }

          # Claude replies only when it is @-mentioned.
          variant :mention_only, -> { Anthropic::Beta::Organization::BetaClaudeTagReplyModeMentionOnly }

          # Like `automatic`, but Claude never pauses on its own. Available where it is enabled for the channel.
          variant :always_awake, -> { Anthropic::Beta::Organization::BetaClaudeTagReplyModeAlwaysAwake }

          # Every new top-level message in the channel gets its own reply from Claude, in a thread under it. Available where it is enabled for the channel, and only once Claude has been used in the channel.
          variant :thread, -> { Anthropic::Beta::Organization::BetaClaudeTagReplyModeThread }

          module Type
            extend Anthropic::Internal::Type::Enum

            AUTOMATIC = :automatic
            MENTION_ONLY = :mention_only
            ALWAYS_AWAKE = :always_awake
            THREAD = :thread

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::Organization::BetaClaudeTagReplyModeAutomatic, Anthropic::Models::Beta::Organization::BetaClaudeTagReplyModeMentionOnly, Anthropic::Models::Beta::Organization::BetaClaudeTagReplyModeAlwaysAwake, Anthropic::Models::Beta::Organization::BetaClaudeTagReplyModeThread)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # @param type [Symbol, Anthropic::Models::Beta::Organization::BetaClaudeTagReplyMode::Type, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::Organization::BetaClaudeTagReplyModeAutomatic, Anthropic::Models::Beta::Organization::BetaClaudeTagReplyModeMentionOnly, Anthropic::Models::Beta::Organization::BetaClaudeTagReplyModeAlwaysAwake, Anthropic::Models::Beta::Organization::BetaClaudeTagReplyModeThread]
          def self.new(type:, **args)
            case type.to_sym
            when :automatic
              Anthropic::Beta::Organization::BetaClaudeTagReplyModeAutomatic.new(**args)
            when :mention_only
              Anthropic::Beta::Organization::BetaClaudeTagReplyModeMentionOnly.new(**args)
            when :always_awake
              Anthropic::Beta::Organization::BetaClaudeTagReplyModeAlwaysAwake.new(**args)
            when :thread
              Anthropic::Beta::Organization::BetaClaudeTagReplyModeThread.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end
      end
    end
  end
end
