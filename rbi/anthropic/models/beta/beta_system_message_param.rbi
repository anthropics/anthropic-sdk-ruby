# typed: strong

module Anthropic
  module Models
    BetaSystemMessageParam = Beta::BetaSystemMessageParam

    module Beta
      class BetaSystemMessageParam < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaSystemMessageParam,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :role

        # How long this system message's text stays in front of the model. `"never"` (the
        # default) renders it on every request that includes it. `"next_user_message"`
        # renders it only for the user turn it follows: once a later `role: "user"`
        # message exists in `messages` the message stays in the array (send it unchanged)
        # but is no longer shown to the model. Only permitted on `role: "system"`
        # messages.
        sig do
          returns(
            T.nilable(
              Anthropic::Beta::BetaSystemMessageParam::ClearAt::OrSymbol
            )
          )
        end
        attr_accessor :clear_at

        sig do
          returns(
            T.nilable(
              Anthropic::Beta::BetaSystemMessageParam::Content::Variants
            )
          )
        end
        attr_reader :content

        sig do
          params(
            content: Anthropic::Beta::BetaSystemMessageParam::Content::Variants
          ).void
        end
        attr_writer :content

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
            clear_at:
              T.nilable(
                Anthropic::Beta::BetaSystemMessageParam::ClearAt::OrSymbol
              ),
            content: Anthropic::Beta::BetaSystemMessageParam::Content::Variants,
            output_config:
              T.nilable(Anthropic::Beta::BetaSystemMessageOutputConfig::OrHash),
            role: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # How long this system message's text stays in front of the model. `"never"` (the
          # default) renders it on every request that includes it. `"next_user_message"`
          # renders it only for the user turn it follows: once a later `role: "user"`
          # message exists in `messages` the message stays in the array (send it unchanged)
          # but is no longer shown to the model. Only permitted on `role: "system"`
          # messages.
          clear_at: nil,
          content: nil,
          # Per-message output configuration on a role:"system" input message.
          #
          # Fields here apply per-turn; `format` remains top-level only. An empty `{}` is
          # accepted on a message that carries content; a message with neither content nor
          # output_config fields is rejected.
          output_config: nil,
          role: :system
        )
        end

        sig do
          override.returns(
            {
              role: Symbol,
              clear_at:
                T.nilable(
                  Anthropic::Beta::BetaSystemMessageParam::ClearAt::OrSymbol
                ),
              content:
                Anthropic::Beta::BetaSystemMessageParam::Content::Variants,
              output_config:
                T.nilable(Anthropic::Beta::BetaSystemMessageOutputConfig)
            }
          )
        end
        def to_hash
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
              T.all(Symbol, Anthropic::Beta::BetaSystemMessageParam::ClearAt)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          NEXT_USER_MESSAGE =
            T.let(
              :next_user_message,
              Anthropic::Beta::BetaSystemMessageParam::ClearAt::TaggedSymbol
            )
          NEVER =
            T.let(
              :never,
              Anthropic::Beta::BetaSystemMessageParam::ClearAt::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaSystemMessageParam::ClearAt::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        module Content
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                String,
                T::Array[
                  Anthropic::Beta::BetaSystemMessageParam::Content::Block::Variants
                ]
              )
            end

          module Block
            extend Anthropic::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Anthropic::Beta::BetaTextBlockParam,
                  Anthropic::Beta::BetaRequestToolAdditionBlock,
                  Anthropic::Beta::BetaRequestToolRemovalBlock
                )
              end

            module Type
              extend Anthropic::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Anthropic::Beta::BetaSystemMessageParam::Content::Block::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              TEXT =
                T.let(
                  :text,
                  Anthropic::Beta::BetaSystemMessageParam::Content::Block::Type::TaggedSymbol
                )
              TOOL_ADDITION =
                T.let(
                  :tool_addition,
                  Anthropic::Beta::BetaSystemMessageParam::Content::Block::Type::TaggedSymbol
                )
              TOOL_REMOVAL =
                T.let(
                  :tool_removal,
                  Anthropic::Beta::BetaSystemMessageParam::Content::Block::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::BetaSystemMessageParam::Content::Block::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::BetaSystemMessageParam::Content::Block::Variants
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
                  Anthropic::Beta::BetaSystemMessageParam::Content::Block::Type::OrSymbol,
                text: String,
                cache_control:
                  T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash),
                citations:
                  T.nilable(
                    T::Array[
                      T.any(
                        Anthropic::Beta::BetaCitationCharLocationParam::OrHash,
                        Anthropic::Beta::BetaCitationPageLocationParam::OrHash,
                        Anthropic::Beta::BetaCitationContentBlockLocationParam::OrHash,
                        Anthropic::Beta::BetaCitationWebSearchResultLocationParam::OrHash,
                        Anthropic::Beta::BetaCitationSearchResultLocationParam::OrHash
                      )
                    ]
                  ),
                tool:
                  T.any(
                    T.any(
                      Anthropic::Beta::BetaToolChangeToolReference::OrHash,
                      Anthropic::Beta::BetaToolChangeMCPToolReference::OrHash,
                      Anthropic::Beta::BetaToolChangeMCPToolsetReference::OrHash,
                      Anthropic::Beta::BetaToolChangeToolDefinitionParam::OrHash
                    ),
                    T.any(
                      Anthropic::Beta::BetaToolChangeToolReference::OrHash,
                      Anthropic::Beta::BetaToolChangeMCPToolReference::OrHash,
                      Anthropic::Beta::BetaToolChangeMCPToolsetReference::OrHash
                    )
                  )
              ).returns(
                Anthropic::Beta::BetaSystemMessageParam::Content::Block::Variants
              )
            end
            def self.new(
              type:,
              text: nil,
              # Create a cache control breakpoint at this content block.
              cache_control: nil,
              citations: nil,
              tool: nil
            )
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaSystemMessageParam::Content::Variants
              ]
            )
          end
          def self.variants
          end

          BlockArray =
            T.let(
              Anthropic::Internal::Type::ArrayOf[
                union: Anthropic::Beta::BetaSystemMessageParam::Content::Block
              ],
              Anthropic::Internal::Type::Converter
            )
        end
      end
    end
  end
end
