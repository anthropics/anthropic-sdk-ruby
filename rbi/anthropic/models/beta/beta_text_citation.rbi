# typed: strong

module Anthropic
  module Models
    BetaTextCitation = Beta::BetaTextCitation

    module Beta
      module BetaTextCitation
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaCitationCharLocation,
              Anthropic::Beta::BetaCitationPageLocation,
              Anthropic::Beta::BetaCitationContentBlockLocation,
              Anthropic::Beta::BetaCitationsWebSearchResultLocation
            )
          end

        sig do
          override.returns(
            T::Array[Anthropic::Beta::BetaTextCitation::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
