# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module MemoryStores
        class BetaManagedAgentsMemoryPrefix < Anthropic::Internal::Type::BaseModel
          # @!attribute path
          #   The rolled-up path prefix, including a trailing `/` (e.g. `/projects/foo/`).
          #   Pass this value as `path_prefix` on a subsequent list call to drill into the
          #   directory.
          #
          #   @return [String]
          required :path, String

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryPrefix::Type]
          required :type, enum: -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryPrefix::Type }

          # @!method initialize(path:, type:)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryPrefix} for more
          #   details.
          #
          #   A rolled-up directory marker returned by
          #   [List memories](/en/api/beta/memory_stores/memories/list) when `depth` is set.
          #   Indicates that one or more memories exist deeper than the requested depth under
          #   this prefix. This is a list-time rollup, not a stored resource; it has no ID and
          #   no lifecycle. Each prefix counts toward the page `limit` and interleaves with
          #   `memory` items in path order.
          #
          #   @param path [String] The rolled-up path prefix, including a trailing `/` (e.g. `/projects/foo/`). Pas
          #
          #   @param type [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryPrefix::Type]

          # @see Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryPrefix#type
          module Type
            extend Anthropic::Internal::Type::Enum

            MEMORY_PREFIX = :memory_prefix

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
