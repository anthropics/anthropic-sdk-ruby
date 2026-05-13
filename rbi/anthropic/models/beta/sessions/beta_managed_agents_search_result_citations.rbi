# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSearchResultCitations < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsSearchResultCitations,
                Anthropic::Internal::AnyHash
              )
            end

          # Whether citations are enabled for this search result.
          sig { returns(T::Boolean) }
          attr_accessor :enabled

          # Citation settings for a search result.
          sig { params(enabled: T::Boolean).returns(T.attached_class) }
          def self.new(
            # Whether citations are enabled for this search result.
            enabled:
          )
          end

          sig { override.returns({ enabled: T::Boolean }) }
          def to_hash
          end
        end
      end
    end
  end
end
