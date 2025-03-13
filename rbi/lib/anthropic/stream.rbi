# typed: strong

module Anthropic
  class Stream
    include Anthropic::BaseStream

    Message = type_member(:in) { {fixed: Anthropic::Util::SSEMessage} }
    Elem = type_member(:out)

    sig { override.returns(T::Enumerable[Elem]) }
    private def iterator
    end

    sig do
      params(
        model: T.any(T::Class[T.anything], Anthropic::Converter),
        url: URI::Generic,
        status: Integer,
        response: Net::HTTPResponse,
        messages: T::Enumerable[Anthropic::Util::SSEMessage]
      )
        .returns(T.attached_class)
    end
    def self.new(model:, url:, status:, response:, messages:)
    end
  end
end
