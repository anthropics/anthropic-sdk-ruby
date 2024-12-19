# frozen_string_literal: true

module Anthropic
  module Models
    class ModelListParams < Anthropic::BaseModel
      # @!attribute after_id
      #   ID of the object to use as a cursor for pagination. When provided, returns the page of results immediately after this object.
      #
      #   @return [String]
      optional :after_id, String

      # @!attribute before_id
      #   ID of the object to use as a cursor for pagination. When provided, returns the page of results immediately before this object.
      #
      #   @return [String]
      optional :before_id, String

      # @!attribute limit
      #   Number of items to return per page.
      #
      # Defaults to `20`. Ranges from `1` to `1000`.
      #
      #   @return [Integer]
      optional :limit, Integer

      # @!parse
      #   # @param after_id [String, nil] ID of the object to use as a cursor for pagination. When provided, returns the
      #   #   page of results immediately after this object.
      #   #
      #   # @param before_id [String, nil] ID of the object to use as a cursor for pagination. When provided, returns the
      #   #   page of results immediately before this object.
      #   #
      #   # @param limit [Integer, nil] Number of items to return per page.
      #   #
      #   #   Defaults to `20`. Ranges from `1` to `1000`.
      #   #
      #   def initialize(after_id: nil, before_id: nil, limit: nil, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void
    end
  end
end
