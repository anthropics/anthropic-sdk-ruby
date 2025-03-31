# typed: strong

module Anthropic
  class Stream
    include Anthropic::Type::BaseStream

    Message = type_member(:in) { {fixed: Anthropic::Util::ServerSentEvent} }
    Elem = type_member(:out)

    # @api private
    sig { override.returns(T::Enumerable[Elem]) }
    private def iterator
    end
  end
end
