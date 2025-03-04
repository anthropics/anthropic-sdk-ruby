# typed: strong

module Anthropic
  class Stream < Anthropic::BaseStream
    Elem = type_member(:out)

    sig { override.returns(T::Enumerable[Elem]) }
    private def iterator
    end
  end
end
