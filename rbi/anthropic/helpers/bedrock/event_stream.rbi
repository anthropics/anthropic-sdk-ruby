# typed: strong

module Anthropic
  module Helpers
    module Bedrock
      module EventStream
        AWS_CONTENT_TYPE =
          T.let(%r{^application/vnd\.amazon\.eventstream}, Regexp)

        class << self
          sig do
            params(chunks: T::Enumerable[String]).returns(T::Enumerable[String])
          end
          def to_sse(chunks)
          end

          sig do
            params(
              decoder: T.untyped,
              chunk: T.nilable(String),
              y: Enumerator::Yielder
            ).void
          end
          def drain(decoder, chunk, y)
          end

          sig { params(msg: T.untyped, y: Enumerator::Yielder).void }
          def emit(msg, y)
          end
        end
      end
    end
  end
end
