# typed: strong

module Anthropic
  class BaseClient
    abstract!

    RequestComponentsShape = T.type_alias do
      {
        method: Symbol,
        path: T.any(String, T::Array[String]),
        query: T.nilable(T::Hash[String, T.nilable(T.any(T::Array[String], String))]),
        headers: T.nilable(T::Hash[String, T.nilable(String)]),
        body: T.nilable(T.anything),
        unwrap: T.nilable(Symbol),
        page: T.nilable(T::Class[Anthropic::BaseModel]),
        model: T.nilable(Anthropic::Converter::Input),
        options: T.nilable(T.any(Anthropic::RequestOptions, T::Hash[Symbol, T.anything]))
      }
    end

    RequestInputShape = T.type_alias do
      {
        method: Symbol,
        url: URI::Generic,
        headers: T::Hash[String, String],
        body: T.anything,
        max_retries: Integer,
        timeout: Float
      }
    end

    MAX_REDIRECTS = 20

    PLATFORM_HEADERS = T::Hash[String, String]

    sig { params(req: Anthropic::BaseClient::RequestComponentsShape).void }
    def self.validate!(req)
    end

    sig do
      params(status: Integer, headers: T.any(T::Hash[String, String], Net::HTTPHeader)).returns(T::Boolean)
    end
    def self.should_retry?(status, headers:)
    end

    sig do
      params(
        request: Anthropic::BaseClient::RequestInputShape,
        status: Integer,
        response_headers: T.any(T::Hash[String, String], Net::HTTPHeader)
      )
        .returns(Anthropic::BaseClient::RequestInputShape)
    end
    def self.follow_redirect(request, status:, response_headers:)
    end

    sig { returns(T.anything) }
    def requester
    end

    sig { params(_: T.anything).returns(T.anything) }
    def requester=(_)
    end

    sig do
      params(
        base_url: String,
        timeout: Float,
        max_retries: Integer,
        initial_retry_delay: Float,
        max_retry_delay: Float,
        headers: T::Hash[String, T.nilable(String)],
        idempotency_header: T.nilable(String)
      )
        .void
    end
    def initialize(
      base_url:,
      timeout: 0.0,
      max_retries: 0,
      initial_retry_delay: 0.0,
      max_retry_delay: 0.0,
      headers: {},
      idempotency_header: nil
    )
    end

    sig { overridable.returns(T::Hash[String, String]) }
    private def auth_headers
    end

    sig { returns(String) }
    private def generate_idempotency_key
    end

    sig do
      overridable
        .params(req: Anthropic::BaseClient::RequestComponentsShape, opts: T::Hash[Symbol, T.anything])
        .returns(Anthropic::BaseClient::RequestInputShape)
    end
    private def build_request(req, opts)
    end

    sig { params(headers: T::Hash[String, String], retry_count: Integer).returns(Float) }
    private def retry_delay(headers, retry_count:)
    end

    sig do
      params(
        request: Anthropic::BaseClient::RequestInputShape,
        redirect_count: Integer,
        retry_count: Integer,
        send_retry_header: T::Boolean
      )
        .returns([Net::HTTPResponse, T::Enumerable[String]])
    end
    private def send_request(request, redirect_count:, retry_count:, send_retry_header:)
    end

    sig do
      params(
        req: Anthropic::BaseClient::RequestComponentsShape,
        headers: T.any(T::Hash[String, String], Net::HTTPHeader),
        stream: T::Enumerable[String]
      )
        .returns(T.anything)
    end
    private def parse_response(req, headers:, stream:)
    end

    sig do
      params(
        method: Symbol,
        path: T.any(String, T::Array[String]),
        query: T.nilable(T::Hash[String, T.nilable(T.any(T::Array[String], String))]),
        headers: T.nilable(T::Hash[String, T.nilable(String)]),
        body: T.nilable(T.anything),
        unwrap: T.nilable(Symbol),
        page: T.nilable(T::Class[Anthropic::BaseModel]),
        model: T.nilable(Anthropic::Converter::Input),
        options: T.nilable(T.any(Anthropic::RequestOptions, T::Hash[Symbol, T.anything]))
      )
        .returns(T.anything)
    end
    def request(
      method,
      path,
      query: {},
      headers: {},
      body: nil,
      unwrap: nil,
      page: nil,
      model: Anthropic::Unknown,
      options: {}
    )
    end

    sig { returns(String) }
    def inspect
    end
  end
end
