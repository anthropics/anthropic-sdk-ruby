# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # What Claude does in a channel while a Slack guest is in it, for everyone in the
        # channel. It changes nothing in a channel without Slack guests. More types can be
        # added.
        module BetaClaudeTagGuestPolicy
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaClaudeTagGuestPolicyAllow,
                Anthropic::Beta::Organization::BetaClaudeTagGuestPolicyRestrict,
                Anthropic::Beta::Organization::BetaClaudeTagGuestPolicyChannelOnly
              )
            end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::BetaClaudeTagGuestPolicy::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ALLOW =
              T.let(
                :allow,
                Anthropic::Beta::Organization::BetaClaudeTagGuestPolicy::Type::TaggedSymbol
              )
            RESTRICT =
              T.let(
                :restrict,
                Anthropic::Beta::Organization::BetaClaudeTagGuestPolicy::Type::TaggedSymbol
              )
            CHANNEL_ONLY =
              T.let(
                :channel_only,
                Anthropic::Beta::Organization::BetaClaudeTagGuestPolicy::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaClaudeTagGuestPolicy::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Organization::BetaClaudeTagGuestPolicy::Variants
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
                Anthropic::Beta::Organization::BetaClaudeTagGuestPolicy::Type::OrSymbol
            ).returns(
              Anthropic::Beta::Organization::BetaClaudeTagGuestPolicy::Variants
            )
          end
          def self.new(type:)
          end
        end
      end
    end
  end
end
