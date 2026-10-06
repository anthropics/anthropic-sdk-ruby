# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsWebFetchURLSourcesParams =
      Beta::BetaManagedAgentsWebFetchURLSourcesParams

    module Beta
      class BetaManagedAgentsWebFetchURLSourcesParams < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsWebFetchURLSourcesParams,
              Anthropic::Internal::AnyHash
            )
          end

        # Which custom tools' results contribute URLs that may be fetched: "all" (the
        # default), "none", or an only or except list. Each name in a list must be a
        # custom tool in the same tools array.
        sig do
          returns(
            T.nilable(
              T.any(
                Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceShorthand::OrSymbol,
                Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceAll,
                Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceNone,
                Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceOnly,
                Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceExcept
              )
            )
          )
        end
        attr_accessor :client_tool_results

        # Which of the web_search and web_fetch tools' results contribute URLs that may be
        # fetched: "all" (the default), "none", or an only or except list. Each name in a
        # list must be "web_search" or "web_fetch".
        sig do
          returns(
            T.nilable(
              T.any(
                Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceShorthand::OrSymbol,
                Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceAll,
                Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceNone,
                Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceOnly,
                Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceExcept
              )
            )
          )
        end
        attr_accessor :server_tool_results

        # Whether URLs in the text of user messages may be fetched: "all" (the default) or
        # "none".
        sig do
          returns(
            T.nilable(
              T.any(
                Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceShorthand::OrSymbol,
                Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceAll,
                Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceNone
              )
            )
          )
        end
        attr_accessor :user_input

        # Which sources contribute URLs the web_fetch tool may fetch. When web_fetch is
        # limited to URLs the conversation has already shown the model (in a user message,
        # a custom tool's result, or an earlier web_search or web_fetch result), each key
        # narrows one of those sources and defaults to "all". Setting all three keys to
        # "none" is rejected.
        sig do
          params(
            client_tool_results:
              T.nilable(
                T.any(
                  Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceShorthand::OrSymbol,
                  Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceAll::OrHash,
                  Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceNone::OrHash,
                  Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceOnly::OrHash,
                  Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceExcept::OrHash
                )
              ),
            server_tool_results:
              T.nilable(
                T.any(
                  Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceShorthand::OrSymbol,
                  Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceAll::OrHash,
                  Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceNone::OrHash,
                  Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceOnly::OrHash,
                  Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceExcept::OrHash
                )
              ),
            user_input:
              T.nilable(
                T.any(
                  Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceShorthand::OrSymbol,
                  Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceAll::OrHash,
                  Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceNone::OrHash
                )
              )
          ).returns(T.attached_class)
        end
        def self.new(
          # Which custom tools' results contribute URLs that may be fetched: "all" (the
          # default), "none", or an only or except list. Each name in a list must be a
          # custom tool in the same tools array.
          client_tool_results: nil,
          # Which of the web_search and web_fetch tools' results contribute URLs that may be
          # fetched: "all" (the default), "none", or an only or except list. Each name in a
          # list must be "web_search" or "web_fetch".
          server_tool_results: nil,
          # Whether URLs in the text of user messages may be fetched: "all" (the default) or
          # "none".
          user_input: nil
        )
        end

        sig do
          override.returns(
            {
              client_tool_results:
                T.nilable(
                  T.any(
                    Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceShorthand::OrSymbol,
                    Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceAll,
                    Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceNone,
                    Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceOnly,
                    Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceExcept
                  )
                ),
              server_tool_results:
                T.nilable(
                  T.any(
                    Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceShorthand::OrSymbol,
                    Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceAll,
                    Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceNone,
                    Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceOnly,
                    Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceExcept
                  )
                ),
              user_input:
                T.nilable(
                  T.any(
                    Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceShorthand::OrSymbol,
                    Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceAll,
                    Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceNone
                  )
                )
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
