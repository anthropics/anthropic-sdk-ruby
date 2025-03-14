# typed: strong

module Anthropic
  class JsonLStream
    include Anthropic::BaseStream

    Message = type_member(:in) { {fixed: T.anything} }
    Elem = type_member(:out)

    # @api private
    sig { override.returns(T::Enumerable[Elem]) }
    private def iterator
    end
  end
end
