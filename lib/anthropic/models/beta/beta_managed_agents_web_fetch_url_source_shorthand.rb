# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # String form of a url_sources value that has no field other than its type: "all"
      # means {"type": "all"} and "none" means {"type": "none"}.
      module BetaManagedAgentsWebFetchURLSourceShorthand
        extend Anthropic::Internal::Type::Enum

        ALL = :all
        NONE = :none

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end

    BetaManagedAgentsWebFetchURLSourceShorthand = Beta::BetaManagedAgentsWebFetchURLSourceShorthand
  end
end
