# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsServerToolUse < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAnalyticsServerToolUse,
                Anthropic::Internal::AnyHash
              )
            end

          # The number of web search requests made.
          sig { returns(Integer) }
          attr_accessor :web_search_requests

          sig { params(web_search_requests: Integer).returns(T.attached_class) }
          def self.new(
            # The number of web search requests made.
            web_search_requests:
          )
          end

          sig { override.returns({ web_search_requests: Integer }) }
          def to_hash
          end
        end
      end
    end
  end
end
