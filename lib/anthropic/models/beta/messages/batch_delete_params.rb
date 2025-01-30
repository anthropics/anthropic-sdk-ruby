# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Messages
        class BatchDeleteParams < Anthropic::BaseModel
          # @!parse
          #   extend Anthropic::RequestParameters::Converter
          include Anthropic::RequestParameters

          # @!attribute [r] betas
          #   Optional header to specify the beta version(s) you want to use.
          #
          #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta::UnionMember1>, nil]
          optional :betas,
                   -> { Anthropic::ArrayOf[union: Anthropic::Models::AnthropicBeta] },
                   api_name: :"anthropic-beta"

          # @!parse
          #   # @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta::UnionMember1>]
          #   attr_writer :betas

          # @!parse
          #   # @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta::UnionMember1>]
          #   # @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
          #   #
          #   def initialize(betas: nil, request_options: {}, **) = super

          # def initialize: (Hash | Anthropic::BaseModel) -> void
        end
      end
    end
  end
end
