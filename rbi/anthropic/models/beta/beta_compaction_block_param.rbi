# typed: strong

module Anthropic
  module Models
    BetaCompactionBlockParam = Beta::BetaCompactionBlockParam

    module Beta
      class BetaCompactionBlockParam < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaCompactionBlockParam,
              Anthropic::Internal::AnyHash
            )
          end

        # Summary of previously compacted content, or null if compaction failed
        sig { returns(T.nilable(String)) }
        attr_accessor :content

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

        # A compaction block containing summary of previous context.
        #
        # Users should round-trip these blocks from responses to subsequent requests to
        # maintain context across compaction boundaries.
        #
        # When content is None, the block represents a failed compaction. The server
        # treats these as no-ops. Empty string content is not allowed.
        sig do
          params(
            content: T.nilable(String),
            cache_control:
              T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Summary of previously compacted content, or null if compaction failed
          content:,
          # Create a cache control breakpoint at this content block.
          cache_control: nil,
          type: :compaction
        )
        end

        sig do
          override.returns(
            {
              content: T.nilable(String),
              type: Symbol,
              cache_control:
                T.nilable(Anthropic::Beta::BetaCacheControlEphemeral)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
