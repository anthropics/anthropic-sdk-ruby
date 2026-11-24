# typed: strong

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          class CaseRespondParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Compliance::Review::CaseRespondParams,
                  Anthropic::Internal::AnyHash
                )
              end

            # The ID of the case (`rvc_...`).
            sig { returns(String) }
            attr_accessor :case_id

            # Your conclusion on the case as a whole. Anthropic doesn't check it against
            # `verdicts`.
            sig do
              returns(
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewDetermination::OrSymbol
              )
            end
            attr_accessor :determination

            # The policy categories that you found were violated. Send one to four with
            # `violation`, and none with `no_violation`. They need not match the case's own.
            # Each value is one of `cyber`, `bio`, `chem`, `radnuc` (radiological or nuclear
            # weapons), `cgw` (conventional weapons), `mgw` (military-grade weapons systems),
            # `io` (influence operations), `fraud`, `violent_extremism`, `surveillance`,
            # `human_exploitation`, `self_harm`, `adult_content`, `reasoning_extraction`,
            # `frontier_llm` (use of the model to accelerate frontier AI research and
            # development in restricted ways), `compromised_key` or `other`, and can appear
            # once.
            sig do
              returns(
                T.nilable(
                  T::Array[
                    Anthropic::Beta::Compliance::Review::BetaComplianceReviewViolatedPolicyCategory::OrSymbol
                  ]
                )
              )
            end
            attr_reader :policy_categories

            sig do
              params(
                policy_categories:
                  T::Array[
                    Anthropic::Beta::Compliance::Review::BetaComplianceReviewViolatedPolicyCategory::OrSymbol
                  ]
              ).void
            end
            attr_writer :policy_categories

            # Your conclusions on individual messages of the case. They need not cover every
            # message, and each `item_id` can appear once.
            sig do
              returns(
                T.nilable(
                  T::Array[
                    Anthropic::Beta::Compliance::Review::BetaComplianceReviewVerdictParam
                  ]
                )
              )
            end
            attr_reader :verdicts

            sig do
              params(
                verdicts:
                  T::Array[
                    Anthropic::Beta::Compliance::Review::BetaComplianceReviewVerdictParam::OrHash
                  ]
              ).void
            end
            attr_writer :verdicts

            # Optional header to specify the beta version(s) you want to use.
            sig do
              returns(
                T.nilable(
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)]
                )
              )
            end
            attr_reader :betas

            sig do
              params(
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)]
              ).void
            end
            attr_writer :betas

            sig do
              params(
                case_id: String,
                determination:
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewDetermination::OrSymbol,
                policy_categories:
                  T::Array[
                    Anthropic::Beta::Compliance::Review::BetaComplianceReviewViolatedPolicyCategory::OrSymbol
                  ],
                verdicts:
                  T::Array[
                    Anthropic::Beta::Compliance::Review::BetaComplianceReviewVerdictParam::OrHash
                  ],
                betas:
                  T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                request_options: Anthropic::RequestOptions::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # The ID of the case (`rvc_...`).
              case_id:,
              # Your conclusion on the case as a whole. Anthropic doesn't check it against
              # `verdicts`.
              determination:,
              # The policy categories that you found were violated. Send one to four with
              # `violation`, and none with `no_violation`. They need not match the case's own.
              # Each value is one of `cyber`, `bio`, `chem`, `radnuc` (radiological or nuclear
              # weapons), `cgw` (conventional weapons), `mgw` (military-grade weapons systems),
              # `io` (influence operations), `fraud`, `violent_extremism`, `surveillance`,
              # `human_exploitation`, `self_harm`, `adult_content`, `reasoning_extraction`,
              # `frontier_llm` (use of the model to accelerate frontier AI research and
              # development in restricted ways), `compromised_key` or `other`, and can appear
              # once.
              policy_categories: nil,
              # Your conclusions on individual messages of the case. They need not cover every
              # message, and each `item_id` can appear once.
              verdicts: nil,
              # Optional header to specify the beta version(s) you want to use.
              betas: nil,
              request_options: {}
            )
            end

            sig do
              override.returns(
                {
                  case_id: String,
                  determination:
                    Anthropic::Beta::Compliance::Review::BetaComplianceReviewDetermination::OrSymbol,
                  policy_categories:
                    T::Array[
                      Anthropic::Beta::Compliance::Review::BetaComplianceReviewViolatedPolicyCategory::OrSymbol
                    ],
                  verdicts:
                    T::Array[
                      Anthropic::Beta::Compliance::Review::BetaComplianceReviewVerdictParam
                    ],
                  betas:
                    T::Array[T.any(Anthropic::AnthropicBeta::OrSymbol, String)],
                  request_options: Anthropic::RequestOptions
                }
              )
            end
            def to_hash
            end
          end
        end
      end
    end
  end
end
