# typed: strong

module Anthropic
  module Models
    class SkillListParams < Anthropic::Internal::Type::BaseModel
      extend Anthropic::Internal::Type::RequestParameters::Converter
      include Anthropic::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Anthropic::SkillListParams, Anthropic::Internal::AnyHash)
        end

      # Number of results to return per page.
      #
      # Ranges from `1` to `1000`. Defaults to `20`.
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # Pagination token for fetching a specific page of results.
      #
      # Pass the value from a previous response's `next_page` field to get the next page
      # of results.
      sig { returns(T.nilable(String)) }
      attr_accessor :page

      # Filter skills by source.
      #
      # If provided, only skills from the specified source will be returned:
      #
      # - `"custom"`: only return user-created skills
      # - `"anthropic"`: only return Anthropic-created skills
      sig { returns(T.nilable(String)) }
      attr_accessor :source

      sig do
        params(
          limit: Integer,
          page: T.nilable(String),
          source: T.nilable(String),
          request_options: Anthropic::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Number of results to return per page.
        #
        # Ranges from `1` to `1000`. Defaults to `20`.
        limit: nil,
        # Pagination token for fetching a specific page of results.
        #
        # Pass the value from a previous response's `next_page` field to get the next page
        # of results.
        page: nil,
        # Filter skills by source.
        #
        # If provided, only skills from the specified source will be returned:
        #
        # - `"custom"`: only return user-created skills
        # - `"anthropic"`: only return Anthropic-created skills
        source: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            limit: Integer,
            page: T.nilable(String),
            source: T.nilable(String),
            request_options: Anthropic::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
