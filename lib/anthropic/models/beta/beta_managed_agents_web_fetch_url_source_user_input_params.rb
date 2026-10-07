# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # Whether URLs in the text of user messages may be fetched. Accepts the string
      # "all" or "none", or the object {"type": "all"} or {"type": "none"}. Responses
      # use the object form.
      module BetaManagedAgentsWebFetchURLSourceUserInputParams
        extend Anthropic::Internal::Type::Union

        # String form of a url_sources value that has no field other than its type: "all" means {"type": "all"} and "none" means {"type": "none"}.
        variant enum: -> { Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceShorthand }

        # Whether URLs in the text of user messages may be fetched.
        variant union: -> { Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceUserInput }

        # @!method self.variants
        #   @return [Array(Symbol, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceShorthand, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceAll, Anthropic::Models::Beta::BetaManagedAgentsWebFetchURLSourceNone)]
      end
    end

    BetaManagedAgentsWebFetchURLSourceUserInputParams =
      Beta::BetaManagedAgentsWebFetchURLSourceUserInputParams
  end
end
