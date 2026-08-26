# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class ExternalKeyListParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::ExternalKeyListParams,
                Anthropic::Internal::AnyHash
              )
            end

          # Number of results per page.
          sig { returns(T.nilable(Integer)) }
          attr_reader :limit

          sig { params(limit: Integer).void }
          attr_writer :limit

          # Opaque cursor from a previous response's `next_page`.
          sig { returns(T.nilable(String)) }
          attr_accessor :page

          sig do
            params(
              limit: Integer,
              page: T.nilable(String),
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Number of results per page.
            limit: nil,
            # Opaque cursor from a previous response's `next_page`.
            page: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                limit: Integer,
                page: T.nilable(String),
                request_options: Anthropic::RequestOptions
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
