# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::Models#list
      class ModelListParams < Anthropic::Internal::Type::BaseModel
        # @!parse
        #   extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        # @!attribute [r] after_id
        #   ID of the object to use as a cursor for pagination. When provided, returns the
        #   page of results immediately after this object.
        #
        #   @return [String, nil]
        optional :after_id, String

        # @!parse
        #   # @return [String]
        #   attr_writer :after_id

        # @!attribute [r] before_id
        #   ID of the object to use as a cursor for pagination. When provided, returns the
        #   page of results immediately before this object.
        #
        #   @return [String, nil]
        optional :before_id, String

        # @!parse
        #   # @return [String]
        #   attr_writer :before_id

        # @!attribute [r] limit
        #   Number of items to return per page.
        #
        #   Defaults to `20`. Ranges from `1` to `1000`.
        #
        #   @return [Integer, nil]
        optional :limit, Integer

        # @!parse
        #   # @return [Integer]
        #   attr_writer :limit

        # @!method initialize(after_id: nil, before_id: nil, limit: nil, request_options: {})
        #   @param after_id [String]
        #   @param before_id [String]
        #   @param limit [Integer]
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
