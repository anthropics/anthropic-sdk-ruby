# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaBrowserRefTarget < Anthropic::Internal::Type::BaseModel
        # @!attribute ref
        #   An element reference (e.g. "ref_7") returned by a prior `read_page` or `find`
        #   result.
        #
        #   @return [String]
        required :ref, String

        # @!attribute type
        #
        #   @return [Symbol, :ref]
        required :type, const: :ref

        # @!method initialize(ref:, type: :ref)
        #   An element on the page, identified by a reference from a prior `read_page` or
        #   `find` result. References are scoped to the tab that produced them and become
        #   stale after navigation or a major re-render.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaBrowserRefTarget} for more details.
        #
        #   @param ref [String] An element reference (e.g. "ref_7") returned by a prior `read_page` or `find` re
        #
        #   @param type [Symbol, :ref]
      end
    end

    BetaBrowserRefTarget = Beta::BetaBrowserRefTarget
  end
end
