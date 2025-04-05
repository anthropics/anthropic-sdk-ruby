# typed: strong

module Anthropic
  module Models
    module Beta
      module BetaTextCitationParam
        extend Anthropic::Internal::Type::Union

        sig do
          override
            .returns(
              [Anthropic::Models::Beta::BetaCitationCharLocationParam, Anthropic::Models::Beta::BetaCitationPageLocationParam, Anthropic::Models::Beta::BetaCitationContentBlockLocationParam]
            )
        end
        def self.variants; end
      end
    end

    BetaTextCitationParam = Beta::BetaTextCitationParam
  end
end
