# typed: strong

module Anthropic
  module Models
    BetaTextCitationParam = Beta::BetaTextCitationParam

    module Beta
      module BetaTextCitationParam
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaCitationCharLocationParam,
              Anthropic::Beta::BetaCitationPageLocationParam,
              Anthropic::Beta::BetaCitationContentBlockLocationParam,
              Anthropic::Beta::BetaCitationWebSearchResultLocationParam
            )
          end

        sig do
          override.returns(
            T::Array[Anthropic::Beta::BetaTextCitationParam::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
