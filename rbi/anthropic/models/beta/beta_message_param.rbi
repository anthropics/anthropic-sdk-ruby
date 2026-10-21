# typed: strong

module Anthropic
  module Models
    BetaMessageParam = Beta::BetaMessageParam

    module Beta
      module BetaMessageParam
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaUserMessageParam,
              Anthropic::Beta::BetaAssistantMessageParam,
              Anthropic::Beta::BetaSystemMessageParam
            )
          end

        module Role
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaMessageParam::Role)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          USER =
            T.let(:user, Anthropic::Beta::BetaMessageParam::Role::TaggedSymbol)
          ASSISTANT =
            T.let(
              :assistant,
              Anthropic::Beta::BetaMessageParam::Role::TaggedSymbol
            )
          SYSTEM =
            T.let(
              :system,
              Anthropic::Beta::BetaMessageParam::Role::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Anthropic::Beta::BetaMessageParam::Role::TaggedSymbol]
            )
          end
          def self.values
          end
        end

        sig do
          override.returns(
            T::Array[Anthropic::Beta::BetaMessageParam::Variants]
          )
        end
        def self.variants
        end

        # Creates a new instance of the variant class whose `role` matches the given
        # value, passing the remaining arguments to its constructor.
        sig do
          params(
            role: Anthropic::Beta::BetaMessageParam::Role::OrSymbol,
            content:
              T.any(
                Anthropic::Beta::BetaMessageContentParam::Variants,
                Anthropic::Beta::BetaSystemMessageParam::Content::Variants
              ),
            clear_at:
              T.nilable(
                Anthropic::Beta::BetaSystemMessageParam::ClearAt::OrSymbol
              ),
            output_config:
              T.nilable(Anthropic::Beta::BetaSystemMessageOutputConfig::OrHash)
          ).returns(Anthropic::Beta::BetaMessageParam::Variants)
        end
        def self.new(
          role:,
          content: nil,
          # How long this system message's text stays in front of the model. `"never"` (the
          # default) renders it on every request that includes it. `"next_user_message"`
          # renders it only for the user turn it follows: once a later `role: "user"`
          # message exists in `messages` the message stays in the array (send it unchanged)
          # but is no longer shown to the model. Only permitted on `role: "system"`
          # messages.
          clear_at: nil,
          # Per-message output configuration on a role:"system" input message.
          #
          # Fields here apply per-turn; `format` remains top-level only. An empty `{}` is
          # accepted on a message that carries content; a message with neither content nor
          # output_config fields is rejected.
          output_config: nil
        )
        end
      end
    end
  end
end
