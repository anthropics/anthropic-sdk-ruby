# typed: strong

module Anthropic
  module Models
    module Messages
      class BatchListParams < Anthropic::BaseModel
        extend Anthropic::RequestParameters::Converter
        include Anthropic::RequestParameters

        Shape = T.type_alias do
          T.all({after_id: String, before_id: String, limit: Integer}, Anthropic::RequestParameters::Shape)
        end

        sig { returns(T.nilable(String)) }
        attr_reader :after_id

        sig { params(after_id: String).void }
        attr_writer :after_id

        sig { returns(T.nilable(String)) }
        attr_reader :before_id

        sig { params(before_id: String).void }
        attr_writer :before_id

        sig { returns(T.nilable(Integer)) }
        attr_reader :limit

        sig { params(limit: Integer).void }
        attr_writer :limit

        sig do
          params(
            after_id: String,
            before_id: String,
            limit: Integer,
            request_options: Anthropic::RequestOpts
          ).void
        end
        def initialize(after_id: nil, before_id: nil, limit: nil, request_options: {}); end

        sig { returns(Anthropic::Models::Messages::BatchListParams::Shape) }
        def to_h; end
      end
    end
  end
end
