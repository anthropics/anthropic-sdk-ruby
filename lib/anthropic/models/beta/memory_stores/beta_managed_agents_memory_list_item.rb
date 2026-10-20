# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module MemoryStores
        # One item in a
        # [List Memories](https://platform.claude.com/docs/en/api/beta/memory_stores/memories/list)
        # response: a `memory`, or a `memory_prefix` marker when `depth` is `1`.
        #
        # @see Anthropic::Resources::Beta::MemoryStores::Memories#list
        module BetaManagedAgentsMemoryListItem
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # A text document at a path inside a memory store.
          #
          # `content` is `null` when the response uses `view=basic`. `content_size_bytes` and `content_sha256` are always set, so you can detect changes without fetching the content. To retrieve, update, or delete a memory, pass its ID, which stays the same when its path changes.
          #
          # See the [memory guide](https://platform.claude.com/docs/en/managed-agents/memory#view-and-edit-memories) to learn more about working with memories.
          variant :memory, -> { Anthropic::Beta::MemoryStores::BetaManagedAgentsMemory }

          # A directory marker that [List Memories](https://platform.claude.com/docs/en/api/beta/memory_stores/memories/list) returns instead of the memories below the requested `depth`.
          #
          # It stands for one or more memories whose paths start with `path`. It isn't a stored object and doesn't have an ID. Each marker counts toward the page `limit`.
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
          # @param type [Symbol, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryListItem::Type, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [String] :id The unique ID of the memory (`mem_...`). It stays the same when the memory's pat
          #
          #   @option args [String] :content_sha256 Lowercase hex SHA-256 digest of the UTF-8 `content` bytes (64 characters). The s
          #
          #   @option args [Integer] :content_size_bytes The size of the memory's `content` in UTF-8 bytes. It is set regardless of `view
          #
          #   @option args [Time] :created_at When this memory was created, in RFC 3339 format.
          #
          #   @option args [String] :memory_store_id ID of the memory store this memory belongs to (a `memstore_...` value).
          #
          #   @option args [String] :memory_version_id The ID of the memory version that holds the memory's current content
          #   (`memver\_..
          #
          #   @option args [String] :path Hierarchical path of the memory within the store, e.g. `/projects/foo/notes.md`.
          #
          #   @option args [Time] :updated_at When the memory was last changed, in RFC 3339.
          #
          #   @option args [String, nil] :content The memory's UTF-8 text content, or `null` when the response uses `view=basic`.
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemory, Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryPrefix]
          def self.new(type:, **args)
            case type.to_sym
            when :memory
              Anthropic::Beta::MemoryStores::BetaManagedAgentsMemory.new(type: type, **args)
            when :memory_prefix
              Anthropic::Beta::MemoryStores::BetaManagedAgentsMemoryPrefix.new(type: type, **args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end
      end
    end
  end
end
