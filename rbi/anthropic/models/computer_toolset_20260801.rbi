# typed: strong

module Anthropic
  module Models
    class ComputerToolset20260801 < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(
            Anthropic::ComputerToolset20260801,
            Anthropic::Internal::AnyHash
          )
        end

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        returns(
          T.nilable(
            T::Array[
              Anthropic::ComputerToolset20260801::AllowedCaller::OrSymbol
            ]
          )
        )
      end
      attr_reader :allowed_callers

      sig do
        params(
          allowed_callers:
            T::Array[
              Anthropic::ComputerToolset20260801::AllowedCaller::OrSymbol
            ]
        ).void
      end
      attr_writer :allowed_callers

      # Create a cache control breakpoint at this content block.
      sig { returns(T.nilable(Anthropic::CacheControlEphemeral)) }
      attr_reader :cache_control

      sig do
        params(
          cache_control: T.nilable(Anthropic::CacheControlEphemeral::OrHash)
        ).void
      end
      attr_writer :cache_control

      # Per-member configuration for `computer_toolset_20260801`: one optional field per
      # member tool, keyed by the member name — the same name the member's `tool_use`
      # blocks carry. Every member is an accepted key, and a member's defaults apply
      # wherever its key is absent. Unknown keys are rejected: the field set is this
      # toolset version's complete member set.
      sig { returns(T.nilable(Anthropic::ComputerToolsetConfigs)) }
      attr_reader :configs

      sig do
        params(
          configs: T.nilable(Anthropic::ComputerToolsetConfigs::OrHash)
        ).void
      end
      attr_writer :configs

      # The computer toolset: a single `tools[]` entry (carrying no `name`) that
      # declares the computer tool family. The model is served the family's tool with
      # any members disabled via `configs` removed from its schema. Every member is
      # enabled by default, zoom included. The single-tool options `display_number` and
      # `enable_zoom` are not fields of a toolset entry — it carries only `type`,
      # `configs`, and `cache_control`; zoom is controlled via `configs.zoom.enabled`.
      sig do
        params(
          allowed_callers:
            T::Array[
              Anthropic::ComputerToolset20260801::AllowedCaller::OrSymbol
            ],
          cache_control: T.nilable(Anthropic::CacheControlEphemeral::OrHash),
          configs: T.nilable(Anthropic::ComputerToolsetConfigs::OrHash),
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        allowed_callers: nil,
        # Create a cache control breakpoint at this content block.
        cache_control: nil,
        # Per-member configuration for `computer_toolset_20260801`: one optional field per
        # member tool, keyed by the member name — the same name the member's `tool_use`
        # blocks carry. Every member is an accepted key, and a member's defaults apply
        # wherever its key is absent. Unknown keys are rejected: the field set is this
        # toolset version's complete member set.
        configs: nil,
        type: :computer_toolset_20260801
      )
      end

      sig do
        override.returns(
          {
            type: Symbol,
            allowed_callers:
              T::Array[
                Anthropic::ComputerToolset20260801::AllowedCaller::OrSymbol
              ],
            cache_control: T.nilable(Anthropic::CacheControlEphemeral),
            configs: T.nilable(Anthropic::ComputerToolsetConfigs)
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
            T.all(Symbol, Anthropic::ComputerToolset20260801::AllowedCaller)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        DIRECT =
          T.let(
            :direct,
            Anthropic::ComputerToolset20260801::AllowedCaller::TaggedSymbol
          )
        CODE_EXECUTION_20250825 =
          T.let(
            :code_execution_20250825,
            Anthropic::ComputerToolset20260801::AllowedCaller::TaggedSymbol
          )
        CODE_EXECUTION_20260120 =
          T.let(
            :code_execution_20260120,
            Anthropic::ComputerToolset20260801::AllowedCaller::TaggedSymbol
          )
        CODE_EXECUTION_20260521 =
          T.let(
            :code_execution_20260521,
            Anthropic::ComputerToolset20260801::AllowedCaller::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Anthropic::ComputerToolset20260801::AllowedCaller::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
