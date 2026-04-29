# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module MemoryStores
        # One item in a [List memories](/en/api/beta/memory_stores/memories/list)
        # response: either a `memory` object or, when `depth` is set, a `memory_prefix`
        # rollup marker.
        #
        # @see Anthropic::Resources::Beta::MemoryStores::Memories#list
        module BetaManagedAgentsMemoryListItem
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # A `memory` object: a single text document at a hierarchical path inside a memory store. The `content` field is populated when `view=full` and `null` when `view=basic`; the `content_size_bytes` and `content_sha256` fields are always populated so sync clients can diff without fetching content. Memories are addressed by their `mem_...` ID; the path is the create key and can be changed via update.
          variant :memory, -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsMemory }

          # A rolled-up directory marker returned by [List memories](/en/api/beta/memory_stores/memories/list) when `depth` is set. Indicates that one or more memories exist deeper than the requested depth under this prefix. This is a list-time rollup, not a stored resource; it has no ID and no lifecycle. Each prefix counts toward the page `limit` and interleaves with `memory` items in path order.
          variant :memory_prefix, -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryPrefix }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemory, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryPrefix)]
        end
      end
    end
  end
end
