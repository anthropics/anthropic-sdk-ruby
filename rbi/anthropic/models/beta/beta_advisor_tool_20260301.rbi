# typed: strong

module Anthropic
  module Models
    BetaAdvisorTool20260301 = Beta::BetaAdvisorTool20260301

    module Beta
      class BetaAdvisorTool20260301 < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaAdvisorTool20260301,
              Anthropic::Internal::AnyHash
            )
          end

        # The model that will complete your prompt.\n\nSee
        # [models](https://docs.anthropic.com/en/docs/models-overview) for additional
        # details and options.
        sig { returns(T.any(Anthropic::Model::OrSymbol, String)) }
        attr_accessor :model

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
                Anthropic::Beta::BetaAdvisorTool20260301::AllowedCaller::OrSymbol
              ]
            )
          )
        end
        attr_reader :allowed_callers

        sig do
          params(
            allowed_callers:
              T::Array[
                Anthropic::Beta::BetaAdvisorTool20260301::AllowedCaller::OrSymbol
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

        # Caching for the advisor's own prompt. When set, each advisor call writes a cache
        # entry at the given TTL so subsequent calls in the same conversation read the
        # stable prefix. When omitted, the advisor prompt is not cached.
        sig { returns(T.nilable(Anthropic::Beta::BetaCacheControlEphemeral)) }
        attr_reader :caching

        sig do
          params(
            caching:
              T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash)
          ).void
        end
        attr_writer :caching

        # If true, tool will not be included in initial system prompt. Only loaded when
        # returned via tool_reference from tool search.
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :defer_loading

        sig { params(defer_loading: T::Boolean).void }
        attr_writer :defer_loading

        # Maximum number of times the tool can be used in the API request.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :max_uses

        # When true, guarantees schema validation on tool names and inputs
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :strict

        sig { params(strict: T::Boolean).void }
        attr_writer :strict

        sig do
          params(
            model: T.any(Anthropic::Model::OrSymbol, String),
            allowed_callers:
              T::Array[
                Anthropic::Beta::BetaAdvisorTool20260301::AllowedCaller::OrSymbol
              ],
            cache_control:
              T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash),
            caching:
              T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash),
            defer_loading: T::Boolean,
            max_uses: T.nilable(Integer),
            strict: T::Boolean,
            name: Symbol,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The model that will complete your prompt.\n\nSee
          # [models](https://docs.anthropic.com/en/docs/models-overview) for additional
          # details and options.
          model:,
          allowed_callers: nil,
          # Create a cache control breakpoint at this content block.
          cache_control: nil,
          # Caching for the advisor's own prompt. When set, each advisor call writes a cache
          # entry at the given TTL so subsequent calls in the same conversation read the
          # stable prefix. When omitted, the advisor prompt is not cached.
          caching: nil,
          # If true, tool will not be included in initial system prompt. Only loaded when
          # returned via tool_reference from tool search.
          defer_loading: nil,
          # Maximum number of times the tool can be used in the API request.
          max_uses: nil,
          # When true, guarantees schema validation on tool names and inputs
          strict: nil,
          # Name of the tool.
          #
          # This is how the tool will be called by the model and in `tool_use` blocks.
          name: :advisor,
          type: :advisor_20260301
        )
        end

        sig do
          override.returns(
            {
              model: T.any(Anthropic::Model::OrSymbol, String),
              name: Symbol,
              type: Symbol,
              allowed_callers:
                T::Array[
                  Anthropic::Beta::BetaAdvisorTool20260301::AllowedCaller::OrSymbol
                ],
              cache_control:
                T.nilable(Anthropic::Beta::BetaCacheControlEphemeral),
              caching: T.nilable(Anthropic::Beta::BetaCacheControlEphemeral),
              defer_loading: T::Boolean,
              max_uses: T.nilable(Integer),
              strict: T::Boolean
            }
          )
        end
        def to_hash
        end

        # Specifies who can invoke a tool.
        #
        # Values: direct: The model can call this tool directly. code_execution_20250825:
        # The tool can be called from the code execution environment (v1).
        # code_execution_20260120: The tool can be called from the code execution
        # environment (v2 with persistence).
        module AllowedCaller
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaAdvisorTool20260301::AllowedCaller
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          DIRECT =
            T.let(
              :direct,
              Anthropic::Beta::BetaAdvisorTool20260301::AllowedCaller::TaggedSymbol
            )
          CODE_EXECUTION_20250825 =
            T.let(
              :code_execution_20250825,
              Anthropic::Beta::BetaAdvisorTool20260301::AllowedCaller::TaggedSymbol
            )
          CODE_EXECUTION_20260120 =
            T.let(
              :code_execution_20260120,
              Anthropic::Beta::BetaAdvisorTool20260301::AllowedCaller::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaAdvisorTool20260301::AllowedCaller::TaggedSymbol
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
