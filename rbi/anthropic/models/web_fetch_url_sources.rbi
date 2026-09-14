# typed: strong

module Anthropic
  module Models
    class WebFetchURLSources < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::WebFetchURLSources, Anthropic::Internal::AnyHash)
        end

      # Which client tools' results contribute fetchable URLs: "all", "none", or an only
      # or except list of client tool names from tools[].
      sig do
        returns(
          T.nilable(
            T.any(
              Anthropic::WebFetchURLSourceAll,
              Anthropic::WebFetchURLSourceNone,
              Anthropic::WebFetchURLSourceOnly,
              Anthropic::WebFetchURLSourceExcept
            )
          )
        )
      end
      attr_reader :client_tool_results

      sig do
        params(
          client_tool_results:
            T.any(
              Anthropic::WebFetchURLSourceAll::OrHash,
              Anthropic::WebFetchURLSourceNone::OrHash,
              Anthropic::WebFetchURLSourceOnly::OrHash,
              Anthropic::WebFetchURLSourceExcept::OrHash
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
              Anthropic::WebFetchURLSourceAll,
              Anthropic::WebFetchURLSourceNone,
              Anthropic::WebFetchURLSourceOnly,
              Anthropic::WebFetchURLSourceExcept
            )
          )
        )
      end
      attr_reader :server_tool_results

      sig do
        params(
          server_tool_results:
            T.any(
              Anthropic::WebFetchURLSourceAll::OrHash,
              Anthropic::WebFetchURLSourceNone::OrHash,
              Anthropic::WebFetchURLSourceOnly::OrHash,
              Anthropic::WebFetchURLSourceExcept::OrHash
            )
        ).void
      end
      attr_writer :server_tool_results

      # Whether URLs in user messages are fetchable: "all" or "none".
      sig do
        returns(
          T.nilable(
            T.any(
              Anthropic::WebFetchURLSourceAll,
              Anthropic::WebFetchURLSourceNone
            )
          )
        )
      end
      attr_reader :user_input

      sig do
        params(
          user_input:
            T.any(
              Anthropic::WebFetchURLSourceAll::OrHash,
              Anthropic::WebFetchURLSourceNone::OrHash
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
              Anthropic::WebFetchURLSourceAll::OrHash,
              Anthropic::WebFetchURLSourceNone::OrHash,
              Anthropic::WebFetchURLSourceOnly::OrHash,
              Anthropic::WebFetchURLSourceExcept::OrHash
            ),
          server_tool_results:
            T.any(
              Anthropic::WebFetchURLSourceAll::OrHash,
              Anthropic::WebFetchURLSourceNone::OrHash,
              Anthropic::WebFetchURLSourceOnly::OrHash,
              Anthropic::WebFetchURLSourceExcept::OrHash
            ),
          user_input:
            T.any(
              Anthropic::WebFetchURLSourceAll::OrHash,
              Anthropic::WebFetchURLSourceNone::OrHash
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
                Anthropic::WebFetchURLSourceAll,
                Anthropic::WebFetchURLSourceNone,
                Anthropic::WebFetchURLSourceOnly,
                Anthropic::WebFetchURLSourceExcept
              ),
            server_tool_results:
              T.any(
                Anthropic::WebFetchURLSourceAll,
                Anthropic::WebFetchURLSourceNone,
                Anthropic::WebFetchURLSourceOnly,
                Anthropic::WebFetchURLSourceExcept
              ),
            user_input:
              T.any(
                Anthropic::WebFetchURLSourceAll,
                Anthropic::WebFetchURLSourceNone
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
              Anthropic::WebFetchURLSourceAll,
              Anthropic::WebFetchURLSourceNone,
              Anthropic::WebFetchURLSourceOnly,
              Anthropic::WebFetchURLSourceExcept
            )
          end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::WebFetchURLSources::ClientToolResults::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ALL =
            T.let(
              :all,
              Anthropic::WebFetchURLSources::ClientToolResults::Type::TaggedSymbol
            )
          NONE =
            T.let(
              :none,
              Anthropic::WebFetchURLSources::ClientToolResults::Type::TaggedSymbol
            )
          ONLY =
            T.let(
              :only,
              Anthropic::WebFetchURLSources::ClientToolResults::Type::TaggedSymbol
            )
          EXCEPT =
            T.let(
              :except,
              Anthropic::WebFetchURLSources::ClientToolResults::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::WebFetchURLSources::ClientToolResults::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        sig do
          override.returns(
            T::Array[Anthropic::WebFetchURLSources::ClientToolResults::Variants]
          )
        end
        def self.variants
        end

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        sig do
          params(
            type: T.any(Symbol, String),
            tools: T::Array[Anthropic::WebFetchURLSourceToolReference::OrHash]
          ).returns(Anthropic::WebFetchURLSources::ClientToolResults::Variants)
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
              Anthropic::WebFetchURLSourceAll,
              Anthropic::WebFetchURLSourceNone,
              Anthropic::WebFetchURLSourceOnly,
              Anthropic::WebFetchURLSourceExcept
            )
          end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::WebFetchURLSources::ServerToolResults::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ALL =
            T.let(
              :all,
              Anthropic::WebFetchURLSources::ServerToolResults::Type::TaggedSymbol
            )
          NONE =
            T.let(
              :none,
              Anthropic::WebFetchURLSources::ServerToolResults::Type::TaggedSymbol
            )
          ONLY =
            T.let(
              :only,
              Anthropic::WebFetchURLSources::ServerToolResults::Type::TaggedSymbol
            )
          EXCEPT =
            T.let(
              :except,
              Anthropic::WebFetchURLSources::ServerToolResults::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::WebFetchURLSources::ServerToolResults::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        sig do
          override.returns(
            T::Array[Anthropic::WebFetchURLSources::ServerToolResults::Variants]
          )
        end
        def self.variants
        end

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        sig do
          params(
            type: T.any(Symbol, String),
            tools: T::Array[Anthropic::WebFetchURLSourceToolReference::OrHash]
          ).returns(Anthropic::WebFetchURLSources::ServerToolResults::Variants)
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
              Anthropic::WebFetchURLSourceAll,
              Anthropic::WebFetchURLSourceNone
            )
          end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::WebFetchURLSources::UserInput::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ALL =
            T.let(
              :all,
              Anthropic::WebFetchURLSources::UserInput::Type::TaggedSymbol
            )
          NONE =
            T.let(
              :none,
              Anthropic::WebFetchURLSources::UserInput::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::WebFetchURLSources::UserInput::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        sig do
          override.returns(
            T::Array[Anthropic::WebFetchURLSources::UserInput::Variants]
          )
        end
        def self.variants
        end

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        sig do
          params(type: T.any(Symbol, String)).returns(
            Anthropic::WebFetchURLSources::UserInput::Variants
          )
        end
        def self.new(type:)
        end
      end
    end
  end
end
