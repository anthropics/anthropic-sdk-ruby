# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        module BetaManagedAgentsAgentEvaluatedPermission
          extend Anthropic::Internal::Type::Enum

          ALLOW = :allow
          ASK = :ask
          DENY = :deny

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
