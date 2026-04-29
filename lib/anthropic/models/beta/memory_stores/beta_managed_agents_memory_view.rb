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

          BASIC = :basic
          FULL = :full

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
