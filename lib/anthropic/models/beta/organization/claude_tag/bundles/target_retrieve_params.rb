# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeTag
          module Bundles
            # @see Anthropic::Resources::Beta::Organization::ClaudeTag::Bundles::Targets#retrieve
            class TargetRetrieveParams < Anthropic::Internal::Type::BaseModel
              extend Anthropic::Internal::Type::RequestParameters::Converter
              include Anthropic::Internal::Type::RequestParameters

              # @!attribute bundle_id
              #   The Bundle's identifier, starting with `capp_`.
              #
              #   @return [String]
              required :bundle_id, String

              # @!attribute target_id
              #   The Bundle Target's identifier, starting with `btgt_`. Attach Bundle and List
              #   Bundle Targets return it. It is never the identifier of the channel or
              #   workspace.
              #
              #   @return [String]
              required :target_id, String

              # @!attribute betas
              #   This endpoint is in beta: requests must send
              #   `experimental-claude-tag-2026-10-21` in this header.
              #
              #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
              optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

              # @!method initialize(bundle_id:, target_id:, betas: nil, request_options: {})
              #   Some parameter documentations has been truncated, see
              #   {Anthropic::Models::Beta::Organization::ClaudeTag::Bundles::TargetRetrieveParams}
              #   for more details.
              #
              #   @param bundle_id [String] The Bundle's identifier, starting with `capp_`.
              #
              #   @param target_id [String] The Bundle Target's identifier, starting with `btgt_`. Attach Bundle and List Bu
              #
              #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] This endpoint is in beta: requests must send `experimental-claude-tag-2026-10-21
              #
              #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
            end
          end
        end
      end
    end
  end
end
