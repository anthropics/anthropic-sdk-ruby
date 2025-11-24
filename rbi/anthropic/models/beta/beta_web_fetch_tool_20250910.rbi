# typed: strong

module Anthropic
  module Models
    BetaWebFetchTool20250910 = Beta::BetaWebFetchTool20250910

    module Beta
      class BetaWebFetchTool20250910 < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaWebFetchTool20250910,
              Anthropic::Internal::AnyHash
            )
          end

        # Name of the tool.
        #
        # This is how the tool will be called by the model and in `tool_use` blocks.
        sig { returns(Symbol) }
        attr_accessor :name

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          returns(
            T.nilable(
              T::Array[
                Anthropic::Beta::BetaWebFetchTool20250910::AllowedCaller::OrSymbol
              ]
            )
          )
        end
        attr_reader :allowed_callers

        sig do
          params(
            allowed_callers:
              T::Array[
                Anthropic::Beta::BetaWebFetchTool20250910::AllowedCaller::OrSymbol
              ]
          ).void
        end
        attr_writer :allowed_callers

        # List of domains to allow fetching from
        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :allowed_domains

        # List of domains to block fetching from
        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :blocked_domains

        # Create a cache control breakpoint at this content block.
        sig { returns(T.nilable(Anthropic::Beta::BetaCacheControlEphemeral)) }
        attr_reader :cache_control

        sig do
          params(
            cache_control:
              T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash)
          ).void
        end
        attr_writer :cache_control

        # Citations configuration for fetched documents. Citations are disabled by
        # default.
        sig { returns(T.nilable(Anthropic::Beta::BetaCitationsConfigParam)) }
        attr_reader :citations

        sig do
          params(
            citations:
              T.nilable(Anthropic::Beta::BetaCitationsConfigParam::OrHash)
          ).void
        end
        attr_writer :citations

        # If true, tool will not be included in initial system prompt. Only loaded when
        # returned via tool_reference from tool search.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :defer_loading

        sig { params(defer_loading: T::Boolean).void }
        attr_writer :defer_loading

        # Maximum number of tokens used by including web page text content in the context.
        # The limit is approximate and does not apply to binary content such as PDFs.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :max_content_tokens

        # Maximum number of times the tool can be used in the API request.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :max_uses

        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :strict

        sig { params(strict: T::Boolean).void }
        attr_writer :strict

        sig do
          params(
            allowed_callers:
              T::Array[
                Anthropic::Beta::BetaWebFetchTool20250910::AllowedCaller::OrSymbol
              ],
            allowed_domains: T.nilable(T::Array[String]),
            blocked_domains: T.nilable(T::Array[String]),
            cache_control:
              T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash),
            citations:
              T.nilable(Anthropic::Beta::BetaCitationsConfigParam::OrHash),
            defer_loading: T::Boolean,
            max_content_tokens: T.nilable(Integer),
            max_uses: T.nilable(Integer),
            strict: T::Boolean,
            name: Symbol,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          allowed_callers: nil,
          # List of domains to allow fetching from
          allowed_domains: nil,
          # List of domains to block fetching from
          blocked_domains: nil,
          # Create a cache control breakpoint at this content block.
          cache_control: nil,
          # Citations configuration for fetched documents. Citations are disabled by
          # default.
          citations: nil,
          # If true, tool will not be included in initial system prompt. Only loaded when
          # returned via tool_reference from tool search.
          defer_loading: nil,
          # Maximum number of tokens used by including web page text content in the context.
          # The limit is approximate and does not apply to binary content such as PDFs.
          max_content_tokens: nil,
          # Maximum number of times the tool can be used in the API request.
          max_uses: nil,
          strict: nil,
          # Name of the tool.
          #
          # This is how the tool will be called by the model and in `tool_use` blocks.
          name: :web_fetch,
          type: :web_fetch_20250910
        )
        end

        sig do
          override.returns(
            {
              name: Symbol,
              type: Symbol,
              allowed_callers:
                T::Array[
                  Anthropic::Beta::BetaWebFetchTool20250910::AllowedCaller::OrSymbol
                ],
              allowed_domains: T.nilable(T::Array[String]),
              blocked_domains: T.nilable(T::Array[String]),
              cache_control:
                T.nilable(Anthropic::Beta::BetaCacheControlEphemeral),
              citations: T.nilable(Anthropic::Beta::BetaCitationsConfigParam),
              defer_loading: T::Boolean,
              max_content_tokens: T.nilable(Integer),
              max_uses: T.nilable(Integer),
              strict: T::Boolean
            }
          )
        end
        def to_hash
        end

        module AllowedCaller
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaWebFetchTool20250910::AllowedCaller
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          DIRECT =
            T.let(
              :direct,
              Anthropic::Beta::BetaWebFetchTool20250910::AllowedCaller::TaggedSymbol
            )
          CODE_EXECUTION_20250825 =
            T.let(
              :code_execution_20250825,
              Anthropic::Beta::BetaWebFetchTool20250910::AllowedCaller::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaWebFetchTool20250910::AllowedCaller::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
