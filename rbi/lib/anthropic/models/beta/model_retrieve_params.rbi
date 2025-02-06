# typed: strong

module Anthropic
  module Models
    module Beta
      class ModelRetrieveParams < Anthropic::BaseModel
        extend Anthropic::RequestParameters::Converter
        include Anthropic::RequestParameters

        sig { params(request_options: T.any(Anthropic::RequestOptions, T::Hash[Symbol, T.anything])).void }
        def initialize(request_options: {}); end

        sig { override.returns({request_options: Anthropic::RequestOptions}) }
        def to_hash; end
      end
    end
  end
end
