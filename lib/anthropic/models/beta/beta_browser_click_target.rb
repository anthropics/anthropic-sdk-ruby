# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # Where to act: either a viewport coordinate or an element reference.
      module BetaBrowserClickTarget
        extend Anthropic::Internal::Type::Union

        discriminator :type

        # A point in the browser viewport, in viewport pixels (the same frame as a
        # full-viewport screenshot).
        variant :coordinate, -> { Anthropic::Beta::BetaBrowserCoordinateTarget }

        # An element on the page, identified by a reference from a prior `read_page` or
        # `find` result. References are scoped to the tab that produced them and become
        # stale after navigation or a major re-render.
        variant :ref, -> { Anthropic::Beta::BetaBrowserRefTarget }

        module Type
          extend Anthropic::Internal::Type::Enum

          COORDINATE = :coordinate
          REF = :ref

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaBrowserCoordinateTarget, Anthropic::Models::Beta::BetaBrowserRefTarget)]

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::BetaBrowserClickTarget} for more details.
        #
        # @param type [Symbol, Anthropic::Models::Beta::BetaBrowserClickTarget::Type, String]
        #
        # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
        #
        #   @option args [Integer] :x Pixels from the left edge of the viewport.
        #
        #   @option args [Integer] :y_ Pixels from the top edge of the viewport.
        #
        #   @option args [String] :ref An element reference (e.g. "ref_7") returned by a prior `read_page` or `find` re
        #
        # @raise [ArgumentError]
        # @return [Anthropic::Models::Beta::BetaBrowserCoordinateTarget, Anthropic::Models::Beta::BetaBrowserRefTarget]
        def self.new(type:, **args)
          case type.to_sym
          when :coordinate
            Anthropic::Beta::BetaBrowserCoordinateTarget.new(**args)
          when :ref
            Anthropic::Beta::BetaBrowserRefTarget.new(**args)
          else
            raise ArgumentError, "unknown type: #{type}"
          end
        end
      end
    end

    BetaBrowserClickTarget = Beta::BetaBrowserClickTarget
  end
end
