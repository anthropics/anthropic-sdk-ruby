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
          #   @return [Symbol, :memory_prefix]
          required :type, const: :memory_prefix

          # @!method initialize(path:, type: :memory_prefix)
          #   A directory marker that
          #   [List Memories](https://platform.claude.com/docs/en/api/beta/memory_stores/memories/list)
          #   returns instead of the memories below the requested `depth`.
          #
          #   It stands for one or more memories whose paths start with `path`. It isn't a
          #   stored object and doesn't have an ID. Each marker counts toward the page
          #   `limit`.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::MemoryStores::BetaManagedAgentsMemoryPrefix} for more
          #   details.
          #
          #   @param path [String] The rolled-up path prefix, including a trailing `/` (e.g. `/projects/foo/`). Pas
          #
          #   @param type [Symbol, :memory_prefix]
        end
      end
    end
  end
end
