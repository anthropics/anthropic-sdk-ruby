# typed: strong

module Anthropic
  module Models
    BetaMessageParam = Beta::BetaMessageParam

    module Beta
      class BetaMessageParam < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaMessageParam,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Anthropic::Beta::BetaMessageParam::Content::Variants) }
        attr_accessor :content

        sig { returns(Anthropic::Beta::BetaMessageParam::Role::OrSymbol) }
        attr_accessor :role

        # How long this system message's text stays in front of the model. `"never"` (the
        # default) renders it on every request that includes it. `"next_user_message"`
        # renders it only for the user turn it follows: once a later `role: "user"`
        # message exists in `messages` the message stays in the array (send it unchanged)
        # but is no longer shown to the model. Only permitted on `role: "system"`
        # messages.
        sig do
          returns(
            T.nilable(Anthropic::Beta::BetaMessageParam::ClearAt::OrSymbol)
          )
        end
        attr_accessor :clear_at

        # Per-message output configuration on a role:"system" input message.
        #
        # Fields here apply per-turn; `format` remains top-level only. An empty `{}` is
        # accepted on a message that carries content; a message with neither content nor
        # output_config fields is rejected.
        sig do
          returns(T.nilable(Anthropic::Beta::BetaSystemMessageOutputConfig))
        end
        attr_reader :output_config

        sig do
          params(
            output_config:
              T.nilable(Anthropic::Beta::BetaSystemMessageOutputConfig::OrHash)
          ).void
        end
        attr_writer :output_config

        sig do
          params(
            content: Anthropic::Beta::BetaMessageParam::Content::Variants,
            role: Anthropic::Beta::BetaMessageParam::Role::OrSymbol,
            clear_at:
              T.nilable(Anthropic::Beta::BetaMessageParam::ClearAt::OrSymbol),
            output_config:
              T.nilable(Anthropic::Beta::BetaSystemMessageOutputConfig::OrHash)
          ).returns(T.attached_class)
        end
        def self.new(
          content:,
          role:,
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

        sig do
          override.returns(
            {
              content: Anthropic::Beta::BetaMessageParam::Content::Variants,
              role: Anthropic::Beta::BetaMessageParam::Role::OrSymbol,
              clear_at:
                T.nilable(Anthropic::Beta::BetaMessageParam::ClearAt::OrSymbol),
              output_config:
                T.nilable(Anthropic::Beta::BetaSystemMessageOutputConfig)
            }
          )
        end
        def to_hash
        end

        module Content
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                String,
                T::Array[Anthropic::Beta::BetaContentBlockParam::Variants]
              )
            end

          sig do
            override.returns(
              T::Array[Anthropic::Beta::BetaMessageParam::Content::Variants]
            )
          end
          def self.variants
          end

          BetaContentBlockParamArray =
            T.let(
              Anthropic::Internal::Type::ArrayOf[
                union: Anthropic::Beta::BetaContentBlockParam
              ],
              Anthropic::Internal::Type::Converter
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

        # How long this system message's text stays in front of the model. `"never"` (the
        # default) renders it on every request that includes it. `"next_user_message"`
        # renders it only for the user turn it follows: once a later `role: "user"`
        # message exists in `messages` the message stays in the array (send it unchanged)
        # but is no longer shown to the model. Only permitted on `role: "system"`
        # messages.
        module ClearAt
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaMessageParam::ClearAt)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          NEXT_USER_MESSAGE =
            T.let(
              :next_user_message,
              Anthropic::Beta::BetaMessageParam::ClearAt::TaggedSymbol
            )
          NEVER =
            T.let(
              :never,
              Anthropic::Beta::BetaMessageParam::ClearAt::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Anthropic::Beta::BetaMessageParam::ClearAt::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
