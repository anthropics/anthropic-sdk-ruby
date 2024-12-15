# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Messages
        class BatchListParams < Anthropic::BaseModel
          # @!attribute after_id
          #   ID of the object to use as a cursor for pagination. When provided, returns the page of results immediately after this object.
          #   @return [String]
          optional :after_id, String

          # @!attribute before_id
          #   ID of the object to use as a cursor for pagination. When provided, returns the page of results immediately before this object.
          #   @return [String]
          optional :before_id, String

          # @!attribute limit
          #   Number of items to return per page.
          #
          # Defaults to `20`. Ranges from `1` to `100`.
          #   @return [Integer]
          optional :limit, Integer

          # @!attribute betas
          #   Optional header to specify the beta version(s) you want to use.
          #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta::UnnamedTypeWithunionParent9>]
          optional :betas, Anthropic::ArrayOf.new(Anthropic::Unknown), api_name: :"anthropic-beta"
        end
      end
    end
  end
end
