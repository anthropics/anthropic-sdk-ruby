# typed: strong

module Anthropic
  module Models
    BetaBrowserToolset20260801 = Beta::BetaBrowserToolset20260801

    module Beta
      class BetaBrowserToolset20260801 < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaBrowserToolset20260801,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          returns(
            T.nilable(
              T::Array[
                Anthropic::Beta::BetaBrowserToolset20260801::AllowedCaller::OrSymbol
              ]
            )
          )
        end
        attr_reader :allowed_callers

        sig do
          params(
            allowed_callers:
              T::Array[
                Anthropic::Beta::BetaBrowserToolset20260801::AllowedCaller::OrSymbol
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

        # Per-member configuration for `browser_toolset_20260801`: one optional field per
        # member tool, keyed by the member name — the same name the member's `tool_use`
        # blocks carry. Every member is an accepted key, and a member's defaults apply
        # wherever its key is absent. Unknown keys are rejected: the field set is this
        # toolset version's complete member set.
        sig { returns(T.nilable(Anthropic::Beta::BetaBrowserToolsetConfigs)) }
        attr_reader :configs

        sig do
          params(
            configs:
              T.nilable(Anthropic::Beta::BetaBrowserToolsetConfigs::OrHash)
          ).void
        end
        attr_writer :configs

        # The browser toolset: a single `tools[]` entry (carrying no `name`) that declares
        # the browser tool family. The model is served the family's tool with any members
        # disabled via `configs` removed from its schema.
        sig do
          params(
            allowed_callers:
              T::Array[
                Anthropic::Beta::BetaBrowserToolset20260801::AllowedCaller::OrSymbol
              ],
            cache_control:
              T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash),
            configs:
              T.nilable(Anthropic::Beta::BetaBrowserToolsetConfigs::OrHash),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          allowed_callers: nil,
          # Create a cache control breakpoint at this content block.
          cache_control: nil,
          # Per-member configuration for `browser_toolset_20260801`: one optional field per
          # member tool, keyed by the member name — the same name the member's `tool_use`
          # blocks carry. Every member is an accepted key, and a member's defaults apply
          # wherever its key is absent. Unknown keys are rejected: the field set is this
          # toolset version's complete member set.
          configs: nil,
          type: :browser_toolset_20260801
        )
        end

        sig do
          override.returns(
            {
              type: Symbol,
              allowed_callers:
                T::Array[
                  Anthropic::Beta::BetaBrowserToolset20260801::AllowedCaller::OrSymbol
                ],
              cache_control:
                T.nilable(Anthropic::Beta::BetaCacheControlEphemeral),
              configs: T.nilable(Anthropic::Beta::BetaBrowserToolsetConfigs)
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
        # environment (v2 with persistence). code_execution_20260521: The tool can be
        # called from the code execution environment (v2 with persistence).
        module AllowedCaller
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaBrowserToolset20260801::AllowedCaller
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          DIRECT =
            T.let(
              :direct,
              Anthropic::Beta::BetaBrowserToolset20260801::AllowedCaller::TaggedSymbol
            )
          CODE_EXECUTION_20250825 =
            T.let(
              :code_execution_20250825,
              Anthropic::Beta::BetaBrowserToolset20260801::AllowedCaller::TaggedSymbol
            )
          CODE_EXECUTION_20260120 =
            T.let(
              :code_execution_20260120,
              Anthropic::Beta::BetaBrowserToolset20260801::AllowedCaller::TaggedSymbol
            )
          CODE_EXECUTION_20260521 =
            T.let(
              :code_execution_20260521,
              Anthropic::Beta::BetaBrowserToolset20260801::AllowedCaller::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaBrowserToolset20260801::AllowedCaller::TaggedSymbol
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
