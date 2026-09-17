# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module MemoryStores
        # The kind of mutation a `memory_version` records. Every non-no-op mutation to a
        # memory appends exactly one version row with one of these values.
        module BetaManagedAgentsMemoryVersionOperation
          extend Anthropic::Internal::Type::Enum

          # The memory was created. The first version in any memory's lineage.
          CREATED = :created

          # The memory's `content`, `path`, or both were changed via update. Writes the agent makes through the filesystem mount also appear as `modified`.
          MODIFIED = :modified

          # The memory was deleted. The `content`, `content_size_bytes`, and `content_sha256` fields are `null` on this version. The preceding version, while it is retained, records the deleted content's size and hash.
          DELETED = :deleted

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
