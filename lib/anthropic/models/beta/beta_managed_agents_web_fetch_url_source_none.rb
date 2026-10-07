# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsWebFetchURLSourceNone < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :none]
        required :type, const: :none

        # @!method initialize(type: :none)
        #   This source contributes no URLs that may be fetched.
        #
        #   @param type [Symbol, :none]
      end
    end

    BetaManagedAgentsWebFetchURLSourceNone = Beta::BetaManagedAgentsWebFetchURLSourceNone
  end
end
