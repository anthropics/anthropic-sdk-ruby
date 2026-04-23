# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module MemoryStores
        # MemoryView enum
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
