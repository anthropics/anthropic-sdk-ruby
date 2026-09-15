# typed: strong

module Anthropic
  module Models
    BetaCompactionBlock = Beta::BetaCompactionBlock

    module Beta
      class BetaCompactionBlock < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaCompactionBlock,
              Anthropic::Internal::AnyHash
            )
          end

        # Summary of compacted content, or null if compaction failed
        sig { returns(T.nilable(String)) }
        attr_accessor :content

        # Opaque metadata from prior compaction, to be round-tripped verbatim
        sig { returns(T.nilable(String)) }
        attr_accessor :encrypted_content

        sig { returns(Symbol) }
        attr_accessor :type

        # Signature over the summary, to be sent back with the block verbatim
        sig { returns(T.nilable(String)) }
        attr_accessor :signature

        # A compaction block returned when autocompact is triggered.
        #
        # When content is None, it indicates the compaction failed to produce a valid
        # summary (e.g., malformed output from the model). Clients may round-trip
        # compaction blocks with null content; the server treats them as no-ops.
        sig do
          params(
            content: T.nilable(String),
            encrypted_content: T.nilable(String),
            signature: T.nilable(String),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Summary of compacted content, or null if compaction failed
          content:,
          # Opaque metadata from prior compaction, to be round-tripped verbatim
          encrypted_content:,
          # Signature over the summary, to be sent back with the block verbatim
          signature: nil,
          type: :compaction
        )
        end

        sig do
          override.returns(
            {
              content: T.nilable(String),
              encrypted_content: T.nilable(String),
              type: Symbol,
              signature: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
