# typed: strong

module Anthropic
  class Stream
    include Anthropic::BaseStream

    Message = type_member(:in) { {fixed: Anthropic::Util::ServerSentEvent} }
    Elem = type_member(:out)

    sig { override.returns(T::Enumerable[Elem]) }
    private def iterator
    end
  end
end
