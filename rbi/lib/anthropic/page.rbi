# typed: strong

module Anthropic
  class Page
    include Anthropic::BasePage

    Elem = type_member

    sig { returns(T::Array[Elem]) }
    attr_accessor :data

    sig { returns(T::Boolean) }
    attr_accessor :has_more

    sig { returns(T.nilable(String)) }
    attr_accessor :first_id

    sig { returns(T.nilable(String)) }
    attr_accessor :last_id

    sig do
      params(
        client: Anthropic::BaseClient,
        req: Anthropic::BaseClient::RequestShape,
        headers: T::Hash[String, String],
        unwrapped: T::Hash[Symbol, T.anything]
      ).void
    end
    def initialize(client:, req:, headers:, unwrapped:)
    end
  end
end
