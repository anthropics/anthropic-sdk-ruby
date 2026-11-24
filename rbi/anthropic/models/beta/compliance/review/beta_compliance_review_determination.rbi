# typed: strong

module Anthropic
  module Models
    module Beta
      module Compliance
        module Review
          # A conclusion on flagged messages: `violation` or `no_violation`.
          module BetaComplianceReviewDetermination
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewDetermination
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            # The messages violated a policy.
            VIOLATION =
              T.let(
                :violation,
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewDetermination::TaggedSymbol
              )

            # The messages violated no policy.
            NO_VIOLATION =
              T.let(
                :no_violation,
                Anthropic::Beta::Compliance::Review::BetaComplianceReviewDetermination::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Compliance::Review::BetaComplianceReviewDetermination::TaggedSymbol
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
