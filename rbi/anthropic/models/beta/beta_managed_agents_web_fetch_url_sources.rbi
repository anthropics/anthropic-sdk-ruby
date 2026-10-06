# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsWebFetchURLSources =
      Beta::BetaManagedAgentsWebFetchURLSources

    module Beta
      class BetaManagedAgentsWebFetchURLSources < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsWebFetchURLSources,
              Anthropic::Internal::AnyHash
            )
          end

        # Which custom tools' results contribute URLs that may be fetched. Null when not
        # set, which allows every custom tool's results.
        sig do
          returns(
            T.nilable(
              Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceToolFilter::Variants
            )
          )
        end
        attr_accessor :client_tool_results

        # Which of the web_search and web_fetch tools' results contribute URLs that may be
        # fetched. Null when not set, which allows both.
        sig do
          returns(
            T.nilable(
              Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceToolFilter::Variants
            )
          )
        end
        attr_accessor :server_tool_results

        # Whether URLs in the text of user messages may be fetched. Null when not set,
        # which allows them.
        sig do
          returns(
            T.nilable(
              Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceUserInput::Variants
            )
          )
        end
        attr_accessor :user_input

        # Which sources contribute URLs the web_fetch tool may fetch. A key that is null
        # was not set and allows every URL from that source.
        sig do
          params(
            client_tool_results:
              T.nilable(
                T.any(
                  Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceAll::OrHash,
                  Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceNone::OrHash,
                  Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceOnly::OrHash,
                  Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceExcept::OrHash
                )
              ),
            server_tool_results:
              T.nilable(
                T.any(
                  Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceAll::OrHash,
                  Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceNone::OrHash,
                  Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceOnly::OrHash,
                  Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceExcept::OrHash
                )
              ),
            user_input:
              T.nilable(
                T.any(
                  Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceAll::OrHash,
                  Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceNone::OrHash
                )
              )
          ).returns(T.attached_class)
        end
        def self.new(
          # Which custom tools' results contribute URLs that may be fetched. Null when not
          # set, which allows every custom tool's results.
          client_tool_results:,
          # Which of the web_search and web_fetch tools' results contribute URLs that may be
          # fetched. Null when not set, which allows both.
          server_tool_results:,
          # Whether URLs in the text of user messages may be fetched. Null when not set,
          # which allows them.
          user_input:
        )
        end

        sig do
          override.returns(
            {
              client_tool_results:
                T.nilable(
                  Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceToolFilter::Variants
                ),
              server_tool_results:
                T.nilable(
                  Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceToolFilter::Variants
                ),
              user_input:
                T.nilable(
                  Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceUserInput::Variants
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
