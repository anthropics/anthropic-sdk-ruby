# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Messages
        class BatchListParams < Anthropic::BaseModel
          # @!attribute [r] after_id
          #   ID of the object to use as a cursor for pagination. When provided, returns the page of results immediately after this object.
          #
          #   @return [String, nil]
          optional :after_id, String

          # @!parse
          #   # @return [String]
          #   attr_writer :after_id

          # @!attribute [r] before_id
          #   ID of the object to use as a cursor for pagination. When provided, returns the page of results immediately before this object.
          #
          #   @return [String, nil]
          optional :before_id, String

          # @!parse
          #   # @return [String]
          #   attr_writer :before_id

          # @!attribute [r] limit
          #   Number of items to return per page.
          #
          # Defaults to `20`. Ranges from `1` to `1000`.
          #
          #   @return [Integer, nil]
          optional :limit, Integer

          # @!parse
          #   # @return [Integer]
          #   attr_writer :limit

          # @!attribute [r] betas
          #   Optional header to specify the beta version(s) you want to use.
          #
          #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta::UnionMember1>]
          optional :betas,
                   -> { Anthropic::ArrayOf[union: Anthropic::Models::AnthropicBeta] },
                   api_name: :"anthropic-beta"

          # @!parse
          #   # @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta::UnionMember1>]
          #   attr_writer :betas

          # @!parse
          #   # @param after_id [String] ID of the object to use as a cursor for pagination. When provided, returns the
          #   #   page of results immediately after this object.
          #   #
          #   # @param before_id [String] ID of the object to use as a cursor for pagination. When provided, returns the
          #   #   page of results immediately before this object.
          #   #
          #   # @param limit [Integer] Number of items to return per page.
          #   #
          #   #   Defaults to `20`. Ranges from `1` to `1000`.
          #   #
          #   # @param betas [Array<String>] Optional header to specify the beta version(s) you want to use.
          #   #
          #   def initialize(after_id: nil, before_id: nil, limit: nil, betas: nil, **) = super

          # def initialize: (Hash | Anthropic::BaseModel) -> void
        end
      end
    end
  end
end
