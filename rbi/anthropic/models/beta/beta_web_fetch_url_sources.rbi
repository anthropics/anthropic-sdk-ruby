# typed: strong

module Anthropic
  module Models
    BetaWebFetchURLSources = Beta::BetaWebFetchURLSources

    module Beta
      class BetaWebFetchURLSources < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaWebFetchURLSources,
              Anthropic::Internal::AnyHash
            )
          end

        # Which client tools' results contribute fetchable URLs: "all", "none", or an only
        # or except list of client tool names from tools[].
        sig do
          returns(
            T.nilable(
              T.any(
                Anthropic::Beta::BetaWebFetchURLSourceAll,
                Anthropic::Beta::BetaWebFetchURLSourceNone,
                Anthropic::Beta::BetaWebFetchURLSourceOnly,
                Anthropic::Beta::BetaWebFetchURLSourceExcept
              )
            )
          )
        end
        attr_reader :client_tool_results

        sig do
          params(
            client_tool_results:
              T.any(
                Anthropic::Beta::BetaWebFetchURLSourceAll::OrHash,
                Anthropic::Beta::BetaWebFetchURLSourceNone::OrHash,
                Anthropic::Beta::BetaWebFetchURLSourceOnly::OrHash,
                Anthropic::Beta::BetaWebFetchURLSourceExcept::OrHash
              )
          ).void
        end
        attr_writer :client_tool_results

        # Which server tools' results contribute fetchable URLs: "all", "none", or an only
        # or except list of server tool names from tools[]; only web_search and web_fetch
        # results ever contribute.
        sig do
          returns(
            T.nilable(
              T.any(
                Anthropic::Beta::BetaWebFetchURLSourceAll,
                Anthropic::Beta::BetaWebFetchURLSourceNone,
                Anthropic::Beta::BetaWebFetchURLSourceOnly,
                Anthropic::Beta::BetaWebFetchURLSourceExcept
              )
            )
          )
        end
        attr_reader :server_tool_results

        sig do
          params(
            server_tool_results:
              T.any(
                Anthropic::Beta::BetaWebFetchURLSourceAll::OrHash,
                Anthropic::Beta::BetaWebFetchURLSourceNone::OrHash,
                Anthropic::Beta::BetaWebFetchURLSourceOnly::OrHash,
                Anthropic::Beta::BetaWebFetchURLSourceExcept::OrHash
              )
          ).void
        end
        attr_writer :server_tool_results

        # Whether URLs in user messages are fetchable: "all" or "none".
        sig do
          returns(
            T.nilable(
              T.any(
                Anthropic::Beta::BetaWebFetchURLSourceAll,
                Anthropic::Beta::BetaWebFetchURLSourceNone
              )
            )
          )
        end
        attr_reader :user_input

        sig do
          params(
            user_input:
              T.any(
                Anthropic::Beta::BetaWebFetchURLSourceAll::OrHash,
                Anthropic::Beta::BetaWebFetchURLSourceNone::OrHash
              )
          ).void
        end
        attr_writer :user_input

        # Which sources contribute to the set of URLs web fetch may fetch.
        #
        # Each key is a tagged variant: `user_input` is `all` or `none`; the two tool
        # filters are `all`, `none`, `only` (only the named tools' results) or `except`
        # (every result but the named tools'). A named tool must be declared in this
        # request's `tools[]`.
        sig do
          params(
            client_tool_results:
              T.any(
                Anthropic::Beta::BetaWebFetchURLSourceAll::OrHash,
                Anthropic::Beta::BetaWebFetchURLSourceNone::OrHash,
                Anthropic::Beta::BetaWebFetchURLSourceOnly::OrHash,
                Anthropic::Beta::BetaWebFetchURLSourceExcept::OrHash
              ),
            server_tool_results:
              T.any(
                Anthropic::Beta::BetaWebFetchURLSourceAll::OrHash,
                Anthropic::Beta::BetaWebFetchURLSourceNone::OrHash,
                Anthropic::Beta::BetaWebFetchURLSourceOnly::OrHash,
                Anthropic::Beta::BetaWebFetchURLSourceExcept::OrHash
              ),
            user_input:
              T.any(
                Anthropic::Beta::BetaWebFetchURLSourceAll::OrHash,
                Anthropic::Beta::BetaWebFetchURLSourceNone::OrHash
              )
          ).returns(T.attached_class)
        end
        def self.new(
          # Which client tools' results contribute fetchable URLs: "all", "none", or an only
          # or except list of client tool names from tools[].
          client_tool_results: nil,
          # Which server tools' results contribute fetchable URLs: "all", "none", or an only
          # or except list of server tool names from tools[]; only web_search and web_fetch
          # results ever contribute.
          server_tool_results: nil,
          # Whether URLs in user messages are fetchable: "all" or "none".
          user_input: nil
        )
        end

        sig do
          override.returns(
            {
              client_tool_results:
                T.any(
                  Anthropic::Beta::BetaWebFetchURLSourceAll,
                  Anthropic::Beta::BetaWebFetchURLSourceNone,
                  Anthropic::Beta::BetaWebFetchURLSourceOnly,
                  Anthropic::Beta::BetaWebFetchURLSourceExcept
                ),
              server_tool_results:
                T.any(
                  Anthropic::Beta::BetaWebFetchURLSourceAll,
                  Anthropic::Beta::BetaWebFetchURLSourceNone,
                  Anthropic::Beta::BetaWebFetchURLSourceOnly,
                  Anthropic::Beta::BetaWebFetchURLSourceExcept
                ),
              user_input:
                T.any(
                  Anthropic::Beta::BetaWebFetchURLSourceAll,
                  Anthropic::Beta::BetaWebFetchURLSourceNone
                )
            }
          )
        end
        def to_hash
        end

        # Which client tools' results contribute fetchable URLs: "all", "none", or an only
        # or except list of client tool names from tools[].
        module ClientToolResults
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::BetaWebFetchURLSourceAll,
                Anthropic::Beta::BetaWebFetchURLSourceNone,
                Anthropic::Beta::BetaWebFetchURLSourceOnly,
                Anthropic::Beta::BetaWebFetchURLSourceExcept
              )
            end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::BetaWebFetchURLSources::ClientToolResults::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ALL =
              T.let(
                :all,
                Anthropic::Beta::BetaWebFetchURLSources::ClientToolResults::Type::TaggedSymbol
              )
            NONE =
              T.let(
                :none,
                Anthropic::Beta::BetaWebFetchURLSources::ClientToolResults::Type::TaggedSymbol
              )
            ONLY =
              T.let(
                :only,
                Anthropic::Beta::BetaWebFetchURLSources::ClientToolResults::Type::TaggedSymbol
              )
            EXCEPT =
              T.let(
                :except,
                Anthropic::Beta::BetaWebFetchURLSources::ClientToolResults::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::BetaWebFetchURLSources::ClientToolResults::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaWebFetchURLSources::ClientToolResults::Variants
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
                Anthropic::Beta::BetaWebFetchURLSources::ClientToolResults::Type::OrSymbol,
              tools:
                T::Array[
                  Anthropic::Beta::BetaWebFetchURLSourceToolReference::OrHash
                ]
            ).returns(
              Anthropic::Beta::BetaWebFetchURLSources::ClientToolResults::Variants
            )
          end
          def self.new(type:, tools: nil)
          end
        end

        # Which server tools' results contribute fetchable URLs: "all", "none", or an only
        # or except list of server tool names from tools[]; only web_search and web_fetch
        # results ever contribute.
        module ServerToolResults
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::BetaWebFetchURLSourceAll,
                Anthropic::Beta::BetaWebFetchURLSourceNone,
                Anthropic::Beta::BetaWebFetchURLSourceOnly,
                Anthropic::Beta::BetaWebFetchURLSourceExcept
              )
            end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::BetaWebFetchURLSources::ServerToolResults::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ALL =
              T.let(
                :all,
                Anthropic::Beta::BetaWebFetchURLSources::ServerToolResults::Type::TaggedSymbol
              )
            NONE =
              T.let(
                :none,
                Anthropic::Beta::BetaWebFetchURLSources::ServerToolResults::Type::TaggedSymbol
              )
            ONLY =
              T.let(
                :only,
                Anthropic::Beta::BetaWebFetchURLSources::ServerToolResults::Type::TaggedSymbol
              )
            EXCEPT =
              T.let(
                :except,
                Anthropic::Beta::BetaWebFetchURLSources::ServerToolResults::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::BetaWebFetchURLSources::ServerToolResults::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaWebFetchURLSources::ServerToolResults::Variants
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
                Anthropic::Beta::BetaWebFetchURLSources::ServerToolResults::Type::OrSymbol,
              tools:
                T::Array[
                  Anthropic::Beta::BetaWebFetchURLSourceToolReference::OrHash
                ]
            ).returns(
              Anthropic::Beta::BetaWebFetchURLSources::ServerToolResults::Variants
            )
          end
          def self.new(type:, tools: nil)
          end
        end

        # Whether URLs in user messages are fetchable: "all" or "none".
        module UserInput
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::BetaWebFetchURLSourceAll,
                Anthropic::Beta::BetaWebFetchURLSourceNone
              )
            end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::BetaWebFetchURLSources::UserInput::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ALL =
              T.let(
                :all,
                Anthropic::Beta::BetaWebFetchURLSources::UserInput::Type::TaggedSymbol
              )
            NONE =
              T.let(
                :none,
                Anthropic::Beta::BetaWebFetchURLSources::UserInput::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::BetaWebFetchURLSources::UserInput::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaWebFetchURLSources::UserInput::Variants
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
                Anthropic::Beta::BetaWebFetchURLSources::UserInput::Type::OrSymbol
            ).returns(
              Anthropic::Beta::BetaWebFetchURLSources::UserInput::Variants
            )
          end
          def self.new(type:)
          end
        end
      end
    end
  end
end
