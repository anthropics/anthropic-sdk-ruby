# typed: strong

module Anthropic
  module Models
    BetaTextCitationParam = T.type_alias { Beta::BetaTextCitationParam }

    module Beta
      class BetaTextCitationParam < Anthropic::Union
        abstract!

        sig do
          override
            .returns(
              [[Symbol, Anthropic::Models::Beta::BetaCitationCharLocationParam], [Symbol, Anthropic::Models::Beta::BetaCitationPageLocationParam], [Symbol, Anthropic::Models::Beta::BetaCitationContentBlockLocationParam]]
            )
        end
        private_class_method def self.variants
        end
      end
    end
  end
end
