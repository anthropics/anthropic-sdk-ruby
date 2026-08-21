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

          module Type
            extend Anthropic::Internal::Type::Enum

            MEMORY = :memory
            MEMORY_PREFIX = :memory_prefix

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemory, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryPrefix)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryListItem} for
          # more details.
          #
          # @param type [Symbol, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [String] :id Unique identifier for this memory (a `mem_...` value). Stable across renames; us
          #
          #   @option args [String] :content_sha256 Lowercase hex SHA-256 digest of the UTF-8 `content` bytes (64 characters). The s
          #
          #   @option args [Integer] :content_size_bytes Size of `content` in bytes (the UTF-8 plaintext length). Always populated, regar
          #
          #   @option args [Time] :created_at A timestamp in RFC 3339 format
          #
          #   @option args [String] :memory_store_id ID of the memory store this memory belongs to (a `memstore_...` value).
          #
          #   @option args [String] :memory_version_id ID of the `memory_version` representing this memory's current content (a `memver
          #
          #   @option args [String] :path Hierarchical path of the memory within the store, e.g. `/projects/foo/notes.md`.
          #
          #   @option args [Time] :updated_at A timestamp in RFC 3339 format
          #
          #   @option args [String, nil] :content The memory's UTF-8 text content. Populated when `view=full`; `null` when `view=b
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemory, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryPrefix]
          def self.new(type:, **args)
            case type.to_sym
            when :memory
              Anthropic::Beta::MemoryStores::BetaManagedAgentsMemory.new(**args)
            when :memory_prefix
              Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryPrefix.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end
      end
    end
  end
end
