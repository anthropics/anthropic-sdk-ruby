# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          # @see Anthropic::Resources::Beta::Compliance::Review::Cases#respond
          class CaseRespondParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            # @!attribute case_id
            #   The ID of the case (`rvc_...`).
            #
            #   @return [String]
            required :case_id, String

            # @!attribute determination
            #   Your conclusion on the case as a whole. Anthropic doesn't check it against
            #   `verdicts`.
            #
            #   @return [Symbol, Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewDetermination]
            required :determination,
                     enum: -> { Anthropic::Beta::Compliance::Review::BetaComplianceReviewDetermination }

            # @!attribute policy_categories
            #   The policy categories that you found were violated. Send one to four with
            #   `violation`, and none with `no_violation`. They need not match the case's own.
            #   Each value is one of `cyber`, `bio`, `chem`, `radnuc` (radiological or nuclear
            #   weapons), `cgw` (conventional weapons), `mgw` (military-grade weapons systems),
            #   `io` (influence operations), `fraud`, `violent_extremism`, `surveillance`,
            #   `human_exploitation`, `self_harm`, `adult_content`, `reasoning_extraction`,
            #   `frontier_llm` (use of the model to accelerate frontier AI research and
            #   development in restricted ways), `compromised_key` or `other`, and can appear
            #   once.
            #
            #   @return [Array<Symbol, Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewViolatedPolicyCategory>, nil]
            optional :policy_categories,
                     -> { Anthropic::Internal::Type::ArrayOf[enum: Anthropic::Beta::Compliance::Review::BetaComplianceReviewViolatedPolicyCategory] }

            # @!attribute verdicts
            #   Your conclusions on individual messages of the case. They need not cover every
            #   message, and each `item_id` can appear once.
            #
            #   @return [Array<Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewVerdictParam>, nil]
            optional :verdicts,
                     -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::Compliance::Review::BetaComplianceReviewVerdictParam] }

            # @!attribute betas
            #   Optional header to specify the beta version(s) you want to use.
            #
            #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
            optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

            # @!method initialize(case_id:, determination:, policy_categories: nil, verdicts: nil, betas: nil, request_options: {})
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Compliance::Review::CaseRespondParams} for more
            #   details.
            #
            #   @param case_id [String] The ID of the case (`rvc_...`).
            #
            #   @param determination [Symbol, Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewDetermination] Your conclusion on the case as a whole. Anthropic doesn't check it against
            #
            #   @param policy_categories [Array<Symbol, Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewViolatedPolicyCategory>] The policy categories that you found were violated. Send one to four with
            #
            #   @param verdicts [Array<Anthropic::Models::Beta::Compliance::Review::BetaComplianceReviewVerdictParam>] Your conclusions on individual messages of the case. They need not cover every m
            #
            #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
            #
            #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
          end
        end
      end
    end
  end
end
