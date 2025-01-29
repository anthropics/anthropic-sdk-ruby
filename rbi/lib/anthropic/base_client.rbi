# typed: strong

module Anthropic
  class BaseClient
    RequestShape = T.type_alias do
      {
        method: Symbol,
        path: T.any(String, T::Array[String]),
        query: T.nilable(T::Hash[String, T.nilable(T.any(T::Array[String], String))]),
        headers: T.nilable(T::Hash[String, T.nilable(String)]),
        body: T.nilable(T.anything),
        unwrap: T.nilable(Symbol),
        page: T.nilable(T::Class[Anthropic::BaseModel]),
        model: T.nilable(Anthropic::Converter::Input),
        options: T.nilable(
          T.any(
            Anthropic::RequestOptions,
            Anthropic::RequestOptions::Shape,
            T::Hash[Symbol, T.anything]
          )
        )
      }
    end

    NormalizedRequestShape = T.type_alias do
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

    sig { params(req: RequestShape).void }
    def self.validate!(req); end

    # @private
    #
    sig { returns(T.anything) }
    attr_accessor :requester

    sig do
      params(
        base_url: String,
        timeout: Float,
        max_retries: Integer,
        initial_retry_delay: Float,
        max_retry_delay: Float,
        headers: T::Hash[String, T.nilable(String)],
        idempotency_header: T.nilable(String)
      ).void
    end
    def initialize(
      base_url:,
      timeout: 0.0,
      max_retries: 0,
      initial_retry_delay: 0.0,
      max_retry_delay: 0.0,
      headers: {},
      idempotency_header: nil
    ); end

    sig { returns(T::Hash[String, String]) }
    private def auth_headers; end

    sig { returns(String) }
    private def generate_idempotency_key; end

    sig do
      params(
        req: Anthropic::BaseClient::RequestShape,
        opts: Anthropic::RequestOptions::Shape
      ).returns(Anthropic::BaseClient::NormalizedRequestShape)
    end
    private def build_request(req, opts); end

    sig { params(status: Integer, headers: T::Hash[String, String]).returns(T::Boolean) }
    private def should_retry?(status, headers:); end

    sig { params(headers: T::Hash[String, String], retry_count: Integer).returns(Float) }
    private def retry_delay(headers, retry_count:); end

    sig do
      params(
        request: Anthropic::BaseClient::NormalizedRequestShape,
        status: Integer,
        location_header: String
      ).returns(Anthropic::BaseClient::NormalizedRequestShape)
    end
    private def follow_redirect(request, status:, location_header:); end

    sig do
      params(
        request: Anthropic::BaseClient::NormalizedRequestShape,
        redirect_count: Integer,
        retry_count: Integer,
        send_retry_header: T::Boolean
      ).returns(Net::HTTPResponse)
    end
    private def send_request(request, redirect_count:, retry_count:, send_retry_header:); end

    sig { params(req: Anthropic::BaseClient::RequestShape, response: NilClass).returns(T.anything) }
    private def parse_response(req, response); end

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
        options: T.nilable(
          T.any(
            Anthropic::RequestOptions,
            Anthropic::RequestOptions::Shape,
            T::Hash[Symbol, T.anything]
          )
        )
      ).returns(T.anything)
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
    ); end

    sig { returns(String) }
    def inspect; end
  end
end
