# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Environments
        class BetaSelfHostedWorkListResponse < Anthropic::Internal::Type::BaseModel
          # @!attribute data
          #   List of work items
          #
          #   @return [Array<Anthropic::Models::Beta::Environments::BetaSelfHostedWork>]
          required :data,
                   -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::Environments::BetaSelfHostedWork] }

          # @!attribute next_page
          #   Opaque cursor for fetching the next page of results
          #
          #   @return [String, nil]
          required :next_page, String, nil?: true

          # @!method initialize(data:, next_page:)
          #   Response when listing work items with cursor-based pagination.
          #
          #   @param data [Array<Anthropic::Models::Beta::Environments::BetaSelfHostedWork>] List of work items
          #
          #   @param next_page [String, nil] Opaque cursor for fetching the next page of results
        end
      end
    end
  end
end
