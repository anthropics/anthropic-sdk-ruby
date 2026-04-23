# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module MemoryStores
        # MemoryVersionOperation enum
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
