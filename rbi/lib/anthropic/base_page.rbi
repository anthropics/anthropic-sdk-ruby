# typed: strong

module Anthropic
  module BasePage
    Elem = type_member(:out)

    sig { returns(T::Boolean) }
    def next_page?; end

    sig { returns(T.self_type) }
    def next_page; end

    sig { params(blk: T.proc.params(arg0: Elem).void).void }
    def auto_paging_each(&blk); end

    sig { returns(T::Enumerable[Elem]) }
    def to_enum; end

    alias_method :enum_for, :to_enum

    sig do
      params(
        client: Anthropic::BaseClient,
        req: Anthropic::BaseClient::RequestShape,
        headers: T::Hash[String, String],
        unwrapped: T.anything
      ).void
    end
    def initialize(client:, req:, headers:, unwrapped:); end
  end
end
