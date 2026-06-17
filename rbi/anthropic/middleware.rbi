# typed: strong

module Anthropic
  # The per-attempt request object a middleware sees.
  class APIRequest
    MEMBERS = T.let(T.unsafe(nil), T::Array[Symbol])

    sig { returns(Symbol) }
    attr_reader :method

    sig { returns(URI::Generic) }
    attr_reader :url

    sig { returns(T::Hash[String, String]) }
    attr_reader :headers

    sig { returns(T.nilable(T.anything)) }
    attr_reader :body

    sig do
      returns(
        T.nilable(
          T::Class[
            Anthropic::Internal::Type::BaseStream[
              T.anything,
              Anthropic::Internal::Type::BaseModel
            ]
          ]
        )
      )
    end
    attr_reader :stream

    sig { returns(T.nilable(Anthropic::Internal::Type::Converter::Input)) }
    attr_reader :cast_to

    sig do
      returns(
        T.nilable(
          T.any(
            Symbol,
            Integer,
            T::Array[T.any(Symbol, Integer)],
            T.proc.params(arg0: T.anything).returns(T.anything)
          )
        )
      )
    end
    attr_reader :unwrap

    sig { returns(T::Hash[Symbol, T.anything]) }
    attr_reader :options

    sig { returns(Integer) }
    attr_reader :retry_count

    sig { returns(T::Hash[Symbol, T.anything]) }
    attr_reader :metadata

    sig { returns(T::Boolean) }
    def streaming?
    end

    sig { returns(T::Boolean) }
    def retry?
    end

    sig { returns(Float) }
    def timeout
    end

    sig do
      params(
        method: Symbol,
        url: URI::Generic,
        headers: T::Hash[String, String],
        body: T.nilable(T.anything),
        stream:
          T.nilable(
            T::Class[
              Anthropic::Internal::Type::BaseStream[
                T.anything,
                Anthropic::Internal::Type::BaseModel
              ]
            ]
          ),
        cast_to: T.nilable(Anthropic::Internal::Type::Converter::Input),
        unwrap:
          T.nilable(
            T.any(
              Symbol,
              Integer,
              T::Array[T.any(Symbol, Integer)],
              T.proc.params(arg0: T.anything).returns(T.anything)
            )
          ),
        options: T::Hash[Symbol, T.anything],
        retry_count: Integer,
        metadata: T::Hash[Symbol, T.anything]
      ).returns(T.attached_class)
    end
    def self.new(
      method:,
      url:,
      headers:,
      body:,
      stream:,
      cast_to:,
      unwrap:,
      options:,
      retry_count:,
      metadata:
    )
    end

    sig do
      params(
        method: Symbol,
        url: URI::Generic,
        headers: T::Hash[String, String],
        body: T.nilable(T.anything),
        stream:
          T.nilable(
            T::Class[
              Anthropic::Internal::Type::BaseStream[
                T.anything,
                Anthropic::Internal::Type::BaseModel
              ]
            ]
          ),
        cast_to: T.nilable(Anthropic::Internal::Type::Converter::Input),
        unwrap:
          T.nilable(
            T.any(
              Symbol,
              Integer,
              T::Array[T.any(Symbol, Integer)],
              T.proc.params(arg0: T.anything).returns(T.anything)
            )
          ),
        options: T::Hash[Symbol, T.anything],
        retry_count: Integer,
        metadata: T::Hash[Symbol, T.anything]
      ).returns(T.self_type)
    end
    def with(
      method: self.method,
      url: self.url,
      headers: self.headers,
      body: self.body,
      stream: self.stream,
      cast_to: self.cast_to,
      unwrap: self.unwrap,
      options: self.options,
      retry_count: self.retry_count,
      metadata: self.metadata
    )
    end

    sig { returns(T::Hash[Symbol, T.anything]) }
    def to_h
    end
  end

  class APIResponse
    class ConsumedBodyError < Anthropic::Errors::Error
    end

    sig { returns(Integer) }
    attr_reader :status

    sig { returns(T::Hash[String, String]) }
    attr_reader :headers

    sig { returns(T.nilable(Net::HTTPResponse)) }
    attr_reader :raw

    sig { returns(T.nilable(Anthropic::APIRequest)) }
    attr_reader :request

    # @api private
    sig do
      params(
        status: Integer,
        raw: Net::HTTPResponse,
        stream: T::Enumerable[String],
        request: T.nilable(Anthropic::APIRequest)
      ).returns(T.attached_class)
    end
    def self.wrap(status, raw, stream, request: nil)
    end

    sig do
      params(
        status: Integer,
        headers: T::Hash[String, String],
        body: T.nilable(T.any(T::Enumerable[String], String)),
        raw: T.nilable(Net::HTTPResponse),
        streaming: T.nilable(T::Boolean),
        request: T.nilable(Anthropic::APIRequest)
      ).returns(T.attached_class)
    end
    def self.new(
      status:,
      headers: {},
      body: nil,
      raw: nil,
      streaming: nil,
      request: nil
    )
    end

    sig { returns(T::Enumerable[String]) }
    def body
    end

    sig { returns(T::Boolean) }
    def streaming?
    end

    sig { returns(T::Boolean) }
    def retryable?
    end

    sig { params(force: T::Boolean).returns(T.self_type) }
    def buffer!(force: false)
    end

    sig do
      params(
        streaming: T::Boolean,
        blk:
          T
            .proc
            .params(upstream: T::Enumerable[String])
            .returns(T::Enumerable[String])
      ).returns(Anthropic::APIResponse)
    end
    def wrap_body(streaming: streaming?, &blk)
    end

    sig { returns(T.anything) }
    def parse
    end

    # @api private
    sig do
      returns(
        [
          Integer,
          T.nilable(Net::HTTPResponse),
          T::Hash[String, String],
          T::Enumerable[String]
        ]
      )
    end
    def to_tuple
    end
  end

  module Middleware
    extend T::Helpers

    abstract!

    # Optional mixin naming the middleware contract — `include` it in a
    # middleware class and implement `#call`. The SDK accepts any
    # `#call(req, nxt)` object, so this is for discovery and type-checking.
    sig do
      abstract
        .params(
          request: Anthropic::APIRequest,
          nxt:
            T
              .proc
              .params(request: Anthropic::APIRequest)
              .returns(Anthropic::APIResponse)
        )
        .returns(Anthropic::APIResponse)
    end
    def call(request, nxt)
    end

    # `(req, nxt) -> APIResponse` callable. `nxt` is itself `(req) -> APIResponse`.
    Callable =
      T.type_alias do
        T
          .proc
          .params(
            req: Anthropic::APIRequest,
            nxt:
              T
                .proc
                .params(req: Anthropic::APIRequest)
                .returns(Anthropic::APIResponse)
          )
          .returns(Anthropic::APIResponse)
      end

    # A single chain entry — a {Callable} lambda, an object including
    # {Anthropic::Middleware}, or any other object responding to
    # `#call(req, nxt)`.
    Entry =
      T.type_alias do
        T.any(Anthropic::Middleware, Anthropic::Middleware::Callable)
      end

    # The `middleware:` constructor option — a single entry or an array of them.
    EntryOrArray =
      T.type_alias do
        T.any(
          Anthropic::Middleware::Entry,
          T::Array[Anthropic::Middleware::Entry]
        )
      end

    class << self
      # @api private
      sig do
        params(
          list: T::Array[T.anything],
          terminal:
            T
              .proc
              .params(req: Anthropic::APIRequest)
              .returns(Anthropic::APIResponse)
        ).returns(
          T
            .proc
            .params(req: Anthropic::APIRequest)
            .returns(Anthropic::APIResponse)
        )
      end
      def build_chain(list, terminal)
      end
    end
  end
end
