# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # How Claude takes part in a Slack channel. A channel alone stores one. More types
        # can be added.
        module BetaClaudeTagReplyMode
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaClaudeTagReplyModeAutomatic,
                Anthropic::Beta::Organization::BetaClaudeTagReplyModeMentionOnly,
                Anthropic::Beta::Organization::BetaClaudeTagReplyModeAlwaysAwake,
                Anthropic::Beta::Organization::BetaClaudeTagReplyModeThread
              )
            end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::BetaClaudeTagReplyMode::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            AUTOMATIC =
              T.let(
                :automatic,
                Anthropic::Beta::Organization::BetaClaudeTagReplyMode::Type::TaggedSymbol
              )
            MENTION_ONLY =
              T.let(
                :mention_only,
                Anthropic::Beta::Organization::BetaClaudeTagReplyMode::Type::TaggedSymbol
              )
            ALWAYS_AWAKE =
              T.let(
                :always_awake,
                Anthropic::Beta::Organization::BetaClaudeTagReplyMode::Type::TaggedSymbol
              )
            THREAD =
              T.let(
                :thread,
                Anthropic::Beta::Organization::BetaClaudeTagReplyMode::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaClaudeTagReplyMode::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Organization::BetaClaudeTagReplyMode::Variants
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
                Anthropic::Beta::Organization::BetaClaudeTagReplyMode::Type::OrSymbol
            ).returns(
              Anthropic::Beta::Organization::BetaClaudeTagReplyMode::Variants
            )
          end
          def self.new(type:)
          end
        end
      end
    end
  end
end
