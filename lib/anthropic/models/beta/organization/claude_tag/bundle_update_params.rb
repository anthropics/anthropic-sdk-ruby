# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeTag
          # @see Anthropic::Resources::Beta::Organization::ClaudeTag::Bundles#update
          class BundleUpdateParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            # @!attribute bundle_id
            #   The Bundle's identifier, starting with `capp_`.
            #
            #   @return [String]
            required :bundle_id, String

            # @!attribute instructions
            #   Instructions for Claude, up to 10,000 bytes (UTF-8), added to the instructions
            #   of every session that can use the Bundle. Null or an empty string clears them.
            #
            #   @return [String, nil]
            optional :instructions, String, nil?: true

            # @!attribute betas
            #   This endpoint is in beta: requests must send
            #   `experimental-claude-tag-2026-10-21` in this header.
            #
            #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
            optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

            # @!method initialize(bundle_id:, instructions: nil, betas: nil, request_options: {})
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Organization::ClaudeTag::BundleUpdateParams} for more
            #   details.
            #
            #   @param bundle_id [String] The Bundle's identifier, starting with `capp_`.
            #
            #   @param instructions [String, nil] Instructions for Claude, up to 10,000 bytes (UTF-8), added to the instructions o
            #
            #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send
            #
            #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
          end
        end
      end
    end
  end
end
