# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsWebFetchURLSourceAll < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :all]
        required :type, const: :all

        # @!method initialize(type: :all)
        #   Every URL from this source may be fetched. This is the default.
        #
        #   @param type [Symbol, :all]
      end
    end

    BetaManagedAgentsWebFetchURLSourceAll = Beta::BetaManagedAgentsWebFetchURLSourceAll
  end
end
