# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module MemoryStores
        # The kind of mutation a `memory_version` records. Every non-no-op mutation to a
        # memory appends exactly one version row with one of these values.
        module BetaManagedAgentsMemoryVersionOperation
          extend Anthropic::Internal::Type::Enum

          CREATED = :created
          MODIFIED = :modified
          DELETED = :deleted

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
