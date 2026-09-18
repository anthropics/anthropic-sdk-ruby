# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module MemoryStores
        # Selects which projection of a `memory` or `memory_version` the server returns.
        # `basic` returns the object with `content` set to `null`; `full` populates
        # `content`. When omitted, the default is endpoint-specific: retrieve operations
        # default to `full`; list, create, and update operations default to `basic`.
        # Listing with `view=full` caps `limit` at 20.
        module BetaManagedAgentsMemoryView
          extend Anthropic::Internal::Type::Enum

          # Return the object with `content` set to `null`. The `content_size_bytes` and `content_sha256` fields remain populated, so sync clients can diff without fetching content.
          BASIC = :basic

          # Return the object with `content` populated. On list endpoints, `view=full` caps `limit` at 20.
          FULL = :full

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
