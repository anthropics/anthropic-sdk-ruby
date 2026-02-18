# typed: strong

module Anthropic
  module Models
    BetaToolSearchToolBm25_20251119 = Beta::BetaToolSearchToolBm25_20251119

    module Beta
      class BetaToolSearchToolBm25_20251119 < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaToolSearchToolBm25_20251119,
              Anthropic::Internal::AnyHash
            )
          end

        # Name of the tool.
        #
        # This is how the tool will be called by the model and in `tool_use` blocks.
        sig { returns(Symbol) }
        attr_accessor :name

        sig do
          returns(
            Anthropic::Beta::BetaToolSearchToolBm25_20251119::Type::OrSymbol
          )
        end
        attr_accessor :type

        sig do
          returns(
            T.nilable(
              T::Array[
                Anthropic::Beta::BetaToolSearchToolBm25_20251119::AllowedCaller::OrSymbol
              ]
            )
          )
        end
        attr_reader :allowed_callers

        sig do
          params(
            allowed_callers:
              T::Array[
                Anthropic::Beta::BetaToolSearchToolBm25_20251119::AllowedCaller::OrSymbol
              ]
          ).void
        end
        attr_writer :allowed_callers

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

        # If true, tool will not be included in initial system prompt. Only loaded when
        # returned via tool_reference from tool search.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :defer_loading

        sig { params(defer_loading: T::Boolean).void }
        attr_writer :defer_loading

        # When true, guarantees schema validation on tool names and inputs
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :strict

        sig { params(strict: T::Boolean).void }
        attr_writer :strict

        sig do
          params(
            type:
              Anthropic::Beta::BetaToolSearchToolBm25_20251119::Type::OrSymbol,
            allowed_callers:
              T::Array[
                Anthropic::Beta::BetaToolSearchToolBm25_20251119::AllowedCaller::OrSymbol
              ],
            cache_control:
              T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash),
            defer_loading: T::Boolean,
            strict: T::Boolean,
            name: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          type:,
          allowed_callers: nil,
          # Create a cache control breakpoint at this content block.
          cache_control: nil,
          # If true, tool will not be included in initial system prompt. Only loaded when
          # returned via tool_reference from tool search.
          defer_loading: nil,
          # When true, guarantees schema validation on tool names and inputs
          strict: nil,
          # Name of the tool.
          #
          # This is how the tool will be called by the model and in `tool_use` blocks.
          name: :tool_search_tool_bm25
        )
        end

        sig do
          override.returns(
            {
              name: Symbol,
              type:
                Anthropic::Beta::BetaToolSearchToolBm25_20251119::Type::OrSymbol,
              allowed_callers:
                T::Array[
                  Anthropic::Beta::BetaToolSearchToolBm25_20251119::AllowedCaller::OrSymbol
                ],
              cache_control:
                T.nilable(Anthropic::Beta::BetaCacheControlEphemeral),
              defer_loading: T::Boolean,
              strict: T::Boolean
            }
          )
        end
        def to_hash
        end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaToolSearchToolBm25_20251119::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          TOOL_SEARCH_TOOL_BM25_20251119 =
            T.let(
              :tool_search_tool_bm25_20251119,
              Anthropic::Beta::BetaToolSearchToolBm25_20251119::Type::TaggedSymbol
            )
          TOOL_SEARCH_TOOL_BM25 =
            T.let(
              :tool_search_tool_bm25,
              Anthropic::Beta::BetaToolSearchToolBm25_20251119::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaToolSearchToolBm25_20251119::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        module AllowedCaller
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaToolSearchToolBm25_20251119::AllowedCaller
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          DIRECT =
            T.let(
              :direct,
              Anthropic::Beta::BetaToolSearchToolBm25_20251119::AllowedCaller::TaggedSymbol
            )
          CODE_EXECUTION_20250825 =
            T.let(
              :code_execution_20250825,
              Anthropic::Beta::BetaToolSearchToolBm25_20251119::AllowedCaller::TaggedSymbol
            )
          CODE_EXECUTION_20260120 =
            T.let(
              :code_execution_20260120,
              Anthropic::Beta::BetaToolSearchToolBm25_20251119::AllowedCaller::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaToolSearchToolBm25_20251119::AllowedCaller::TaggedSymbol
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
