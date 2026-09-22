# typed: strong

module Anthropic
  module Models
    BetaComputerToolset20260801 = Beta::BetaComputerToolset20260801

    module Beta
      class BetaComputerToolset20260801 < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaComputerToolset20260801,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

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

        # Sparse per-member overrides, keyed by member name. Absent, null, and {} are
        # equivalent; a member's defaults apply wherever its key is absent.
        sig { returns(T.nilable(Anthropic::Beta::BetaComputerToolsetConfigs)) }
        attr_reader :configs

        sig do
          params(
            configs:
              T.nilable(Anthropic::Beta::BetaComputerToolsetConfigs::OrHash)
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
            cache_control:
              T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash),
            configs:
              T.nilable(Anthropic::Beta::BetaComputerToolsetConfigs::OrHash),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Create a cache control breakpoint at this content block.
          cache_control: nil,
          # Sparse per-member overrides, keyed by member name. Absent, null, and {} are
          # equivalent; a member's defaults apply wherever its key is absent.
          configs: nil,
          type: :computer_toolset_20260801
        )
        end

        sig do
          override.returns(
            {
              type: Symbol,
              cache_control:
                T.nilable(Anthropic::Beta::BetaCacheControlEphemeral),
              configs: T.nilable(Anthropic::Beta::BetaComputerToolsetConfigs)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
