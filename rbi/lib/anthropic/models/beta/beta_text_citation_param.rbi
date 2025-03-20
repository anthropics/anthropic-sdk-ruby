# typed: strong

module Anthropic
  module Models
    module Beta
      module BetaTextCitationParam
        extend Anthropic::Union

        Variants =
          type_template(:out) do
            {
              fixed: T.any(
                Anthropic::Models::Beta::BetaCitationCharLocationParam,
                Anthropic::Models::Beta::BetaCitationPageLocationParam,
                Anthropic::Models::Beta::BetaCitationContentBlockLocationParam
              )
            }
          end

        class << self
          sig do
            override
              .returns(
                [Anthropic::Models::Beta::BetaCitationCharLocationParam, Anthropic::Models::Beta::BetaCitationPageLocationParam, Anthropic::Models::Beta::BetaCitationContentBlockLocationParam]
              )
          end
          def variants
          end
        end
      end
    end

    BetaTextCitationParam = Beta::BetaTextCitationParam
  end
end
