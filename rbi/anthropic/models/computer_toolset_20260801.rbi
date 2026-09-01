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
          cache_control: T.nilable(Anthropic::CacheControlEphemeral::OrHash),
          configs: T.nilable(Anthropic::ComputerToolsetConfigs::OrHash),
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
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
            cache_control: T.nilable(Anthropic::CacheControlEphemeral),
            configs: T.nilable(Anthropic::ComputerToolsetConfigs)
          }
        )
      end
      def to_hash
      end
    end
  end
end
