# typed: strong

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          module BetaComplianceReviewPolicyCategory
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewPolicyCategory
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            CYBER =
              T.let(
                :cyber,
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewPolicyCategory::TaggedSymbol
              )
            BIO =
              T.let(
                :bio,
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewPolicyCategory::TaggedSymbol
              )
            CHEM =
              T.let(
                :chem,
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewPolicyCategory::TaggedSymbol
              )
            RADNUC =
              T.let(
                :radnuc,
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewPolicyCategory::TaggedSymbol
              )
            CGW =
              T.let(
                :cgw,
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewPolicyCategory::TaggedSymbol
              )
            MGW =
              T.let(
                :mgw,
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewPolicyCategory::TaggedSymbol
              )
            IO =
              T.let(
                :io,
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewPolicyCategory::TaggedSymbol
              )
            FRAUD =
              T.let(
                :fraud,
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewPolicyCategory::TaggedSymbol
              )
            VIOLENT_EXTREMISM =
              T.let(
                :violent_extremism,
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewPolicyCategory::TaggedSymbol
              )
            SURVEILLANCE =
              T.let(
                :surveillance,
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewPolicyCategory::TaggedSymbol
              )
            HUMAN_EXPLOITATION =
              T.let(
                :human_exploitation,
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewPolicyCategory::TaggedSymbol
              )
            SELF_HARM =
              T.let(
                :self_harm,
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewPolicyCategory::TaggedSymbol
              )
            ADULT_CONTENT =
              T.let(
                :adult_content,
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewPolicyCategory::TaggedSymbol
              )
            REASONING_EXTRACTION =
              T.let(
                :reasoning_extraction,
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewPolicyCategory::TaggedSymbol
              )
            FRONTIER_LLM =
              T.let(
                :frontier_llm,
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewPolicyCategory::TaggedSymbol
              )
            COMPROMISED_KEY =
              T.let(
                :compromised_key,
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewPolicyCategory::TaggedSymbol
              )
            BENIGN =
              T.let(
                :benign,
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewPolicyCategory::TaggedSymbol
              )
            OTHER =
              T.let(
                :other,
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewPolicyCategory::TaggedSymbol
              )
            UNDETERMINED =
              T.let(
                :undetermined,
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewPolicyCategory::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewPolicyCategory::TaggedSymbol
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
