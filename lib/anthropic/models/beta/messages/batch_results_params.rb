# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Messages
        class BatchResultsParams < Anthropic::BaseModel
          # @!attribute betas
          #   Optional header to specify the beta version(s) you want to use.
          #
          #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta::UnnamedTypeWithunionParent11>]
          optional :betas, Anthropic::ArrayOf.new(Anthropic::Unknown), api_name: :"anthropic-beta"

          # @!parse
          #   # @param betas [Array<String>, nil] Optional header to specify the beta version(s) you want to use.
          #   #
          #   def initialize(betas: nil) = super

          # def initialize: (Hash | Anthropic::BaseModel) -> void
        end
      end
    end
  end
end
