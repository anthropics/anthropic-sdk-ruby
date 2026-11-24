# typed: strong

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          module BetaComplianceReviewViolatedPolicyCategory
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewViolatedPolicyCategory
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            CYBER =
              T.let(
                :cyber,
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewViolatedPolicyCategory::TaggedSymbol
              )
            BIO =
              T.let(
                :bio,
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewViolatedPolicyCategory::TaggedSymbol
              )
            CHEM =
              T.let(
                :chem,
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewViolatedPolicyCategory::TaggedSymbol
              )
            RADNUC =
              T.let(
                :radnuc,
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewViolatedPolicyCategory::TaggedSymbol
              )
            CGW =
              T.let(
                :cgw,
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewViolatedPolicyCategory::TaggedSymbol
              )
            MGW =
              T.let(
                :mgw,
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewViolatedPolicyCategory::TaggedSymbol
              )
            IO =
              T.let(
                :io,
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewViolatedPolicyCategory::TaggedSymbol
              )
            FRAUD =
              T.let(
                :fraud,
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewViolatedPolicyCategory::TaggedSymbol
              )
            VIOLENT_EXTREMISM =
              T.let(
                :violent_extremism,
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewViolatedPolicyCategory::TaggedSymbol
              )
            SURVEILLANCE =
              T.let(
                :surveillance,
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewViolatedPolicyCategory::TaggedSymbol
              )
            HUMAN_EXPLOITATION =
              T.let(
                :human_exploitation,
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewViolatedPolicyCategory::TaggedSymbol
              )
            SELF_HARM =
              T.let(
                :self_harm,
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewViolatedPolicyCategory::TaggedSymbol
              )
            ADULT_CONTENT =
              T.let(
                :adult_content,
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewViolatedPolicyCategory::TaggedSymbol
              )
            REASONING_EXTRACTION =
              T.let(
                :reasoning_extraction,
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewViolatedPolicyCategory::TaggedSymbol
              )
            FRONTIER_LLM =
              T.let(
                :frontier_llm,
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewViolatedPolicyCategory::TaggedSymbol
              )
            COMPROMISED_KEY =
              T.let(
                :compromised_key,
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewViolatedPolicyCategory::TaggedSymbol
              )
            OTHER =
              T.let(
                :other,
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewViolatedPolicyCategory::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewViolatedPolicyCategory::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end
    end
  end
end
