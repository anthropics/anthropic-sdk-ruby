# typed: strong

module Anthropic
  module Models
    module Beta
      module Environments
        class BetaSelfHostedWorkListResponse < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Environments::BetaSelfHostedWorkListResponse,
                Anthropic::Internal::AnyHash
              )
            end

          # List of work items
          sig do
            returns(T::Array[Anthropic::Beta::Environments::BetaSelfHostedWork])
          end
          attr_accessor :data

          # Opaque cursor for fetching the next page of results
          sig { returns(T.nilable(String)) }
          attr_accessor :next_page

          # Response when listing work items with cursor-based pagination.
          sig do
            params(
              data:
                T::Array[
                  Anthropic::Beta::Environments::BetaSelfHostedWork::OrHash
                ],
              next_page: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            # List of work items
            data:,
            # Opaque cursor for fetching the next page of results
            next_page:
          )
          end

          sig do
            override.returns(
              {
                data:
                  T::Array[Anthropic::Beta::Environments::BetaSelfHostedWork],
                next_page: T.nilable(String)
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
