# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          module BetaComplianceReviewPolicyCategory
            extend Anthropic::Internal::Type::Enum

            CYBER = :cyber
            BIO = :bio
            CHEM = :chem
            RADNUC = :radnuc
            CGW = :cgw
            MGW = :mgw
            IO = :io
            FRAUD = :fraud
            VIOLENT_EXTREMISM = :violent_extremism
            SURVEILLANCE = :surveillance
            HUMAN_EXPLOITATION = :human_exploitation
            SELF_HARM = :self_harm
            ADULT_CONTENT = :adult_content
            REASONING_EXTRACTION = :reasoning_extraction
            FRONTIER_LLM = :frontier_llm
            COMPROMISED_KEY = :compromised_key
            BENIGN = :benign
            OTHER = :other
            UNDETERMINED = :undetermined

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
