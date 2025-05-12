# typed: strong

module Anthropic
  module Models
    module Messages
      class BatchListParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Messages::BatchListParams,
              Anthropic::Internal::AnyHash
            )
          end

        # ID of the object to use as a cursor for pagination. When provided, returns the
        # page of results immediately after this object.
        sig { returns(T.nilable(String)) }
        attr_reader :after_id

        sig { params(after_id: String).void }
        attr_writer :after_id

        # ID of the object to use as a cursor for pagination. When provided, returns the
        # page of results immediately before this object.
        sig { returns(T.nilable(String)) }
        attr_reader :before_id

        sig { params(before_id: String).void }
        attr_writer :before_id

        # Number of items to return per page.
        #
        # Defaults to `20`. Ranges from `1` to `1000`.
        sig { returns(T.nilable(Integer)) }
        attr_reader :limit

        sig { params(limit: Integer).void }
        attr_writer :limit

        sig do
          params(
            after_id: String,
            before_id: String,
            limit: Integer,
            request_options: Anthropic::RequestOptions::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # ID of the object to use as a cursor for pagination. When provided, returns the
          # page of results immediately after this object.
          after_id: nil,
          # ID of the object to use as a cursor for pagination. When provided, returns the
          # page of results immediately before this object.
          before_id: nil,
          # Number of items to return per page.
          #
          # Defaults to `20`. Ranges from `1` to `1000`.
          limit: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              after_id: String,
              before_id: String,
              limit: Integer,
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
