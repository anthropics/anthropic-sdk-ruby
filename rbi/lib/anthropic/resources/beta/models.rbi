# typed: strong

module Anthropic
  module Resources
    class Beta
      class Models
        sig do
          params(
            model_id: String,
            request_options: Anthropic::RequestOpts
          ).returns(Anthropic::Models::Beta::BetaModelInfo)
        end
        def retrieve(model_id, request_options: {}); end

        sig do
          params(
            after_id: String,
            before_id: String,
            limit: Integer,
            request_options: Anthropic::RequestOpts
          ).returns(Anthropic::Page[Anthropic::Models::Beta::BetaModelInfo])
        end
        def list(after_id:, before_id:, limit:, request_options: {}); end

        sig { params(client: Anthropic::Client).void }
        def initialize(client:); end
      end
    end
  end
end
