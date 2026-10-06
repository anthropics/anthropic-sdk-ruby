# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsWebFetchURLSourceToolFilterParams =
      Beta::BetaManagedAgentsWebFetchURLSourceToolFilterParams

    module Beta
      # Which tools' results contribute URLs that may be fetched. Accepts the string
      # "all" or "none", or an object whose type is "all", "none", "only" or "except".
      # Responses use the object form.
      module BetaManagedAgentsWebFetchURLSourceToolFilterParams
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceShorthand::TaggedSymbol,
              Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceToolFilter::Variants
            )
          end

        sig do
          override.returns(
            T::Array[
              Anthropic::Beta::BetaManagedAgentsWebFetchURLSourceToolFilterParams::Variants
            ]
          )
        end
        def self.variants
        end
      end
    end
  end
end
