# typed: strong

module Anthropic
  AnthropicBeta = Anthropic::Models::AnthropicBeta

  APIErrorObject = Anthropic::Models::APIErrorObject

  AuthenticationError = Anthropic::Models::AuthenticationError

  Base64ImageSource = Anthropic::Models::Base64ImageSource

  Base64PDFSource = Anthropic::Models::Base64PDFSource

  Beta = Anthropic::Models::Beta

  BetaAPIError = Anthropic::Models::BetaAPIError

  BetaAuthenticationError = Anthropic::Models::BetaAuthenticationError

  BetaBillingError = Anthropic::Models::BetaBillingError

  BetaError = Anthropic::Models::BetaError

  BetaErrorResponse = Anthropic::Models::BetaErrorResponse

  BetaGatewayTimeoutError = Anthropic::Models::BetaGatewayTimeoutError

  BetaInvalidRequestError = Anthropic::Models::BetaInvalidRequestError

  BetaNotFoundError = Anthropic::Models::BetaNotFoundError

  BetaOverloadedError = Anthropic::Models::BetaOverloadedError

  BetaPermissionError = Anthropic::Models::BetaPermissionError

  BetaRateLimitError = Anthropic::Models::BetaRateLimitError

  BillingError = Anthropic::Models::BillingError

  CacheControlEphemeral = Anthropic::Models::CacheControlEphemeral

  CitationCharLocation = Anthropic::Models::CitationCharLocation

  CitationCharLocationParam = Anthropic::Models::CitationCharLocationParam

  CitationContentBlockLocation = Anthropic::Models::CitationContentBlockLocation

  CitationContentBlockLocationParam =
    Anthropic::Models::CitationContentBlockLocationParam

  CitationPageLocation = Anthropic::Models::CitationPageLocation

  CitationPageLocationParam = Anthropic::Models::CitationPageLocationParam

  CitationsConfigParam = Anthropic::Models::CitationsConfigParam

  CitationsDelta = Anthropic::Models::CitationsDelta

  CitationsWebSearchResultLocation =
    Anthropic::Models::CitationsWebSearchResultLocation

  CitationWebSearchResultLocationParam =
    Anthropic::Models::CitationWebSearchResultLocationParam

  Completion = Anthropic::Models::Completion

  CompletionCreateParams = Anthropic::Models::CompletionCreateParams

  ContentBlock = Anthropic::Models::ContentBlock

  ContentBlockParam = Anthropic::Models::ContentBlockParam

  ContentBlockSource = Anthropic::Models::ContentBlockSource

  ContentBlockSourceContent = Anthropic::Models::ContentBlockSourceContent

  DocumentBlockParam = Anthropic::Models::DocumentBlockParam

  ErrorObject = Anthropic::Models::ErrorObject

  ErrorResponse = Anthropic::Models::ErrorResponse

  GatewayTimeoutError = Anthropic::Models::GatewayTimeoutError

  ImageBlockParam = Anthropic::Models::ImageBlockParam

  InputJSONDelta = Anthropic::Models::InputJSONDelta

  InvalidRequestError = Anthropic::Models::InvalidRequestError

  Message = Anthropic::Models::Message

  MessageCountTokensParams = Anthropic::Models::MessageCountTokensParams

  MessageCountTokensTool = Anthropic::Models::MessageCountTokensTool

  MessageCreateParams = Anthropic::Models::MessageCreateParams

  MessageDeltaUsage = Anthropic::Models::MessageDeltaUsage

  MessageParam = Anthropic::Models::MessageParam

  Messages = Anthropic::Models::Messages

  MessageTokensCount = Anthropic::Models::MessageTokensCount

  Metadata = Anthropic::Models::Metadata

  Model = Anthropic::Models::Model

  ModelInfo = Anthropic::Models::ModelInfo

  ModelListParams = Anthropic::Models::ModelListParams

  ModelRetrieveParams = Anthropic::Models::ModelRetrieveParams

  NotFoundError = Anthropic::Models::NotFoundError

  OverloadedError = Anthropic::Models::OverloadedError

  PermissionError = Anthropic::Models::PermissionError

  PlainTextSource = Anthropic::Models::PlainTextSource

  RateLimitError = Anthropic::Models::RateLimitError

  RawContentBlockDelta = Anthropic::Models::RawContentBlockDelta

  RawContentBlockDeltaEvent = Anthropic::Models::RawContentBlockDeltaEvent

  RawContentBlockStartEvent = Anthropic::Models::RawContentBlockStartEvent

  RawContentBlockStopEvent = Anthropic::Models::RawContentBlockStopEvent

  RawMessageDeltaEvent = Anthropic::Models::RawMessageDeltaEvent

  RawMessageStartEvent = Anthropic::Models::RawMessageStartEvent

  RawMessageStopEvent = Anthropic::Models::RawMessageStopEvent

  RawMessageStreamEvent = Anthropic::Models::RawMessageStreamEvent

  RedactedThinkingBlock = Anthropic::Models::RedactedThinkingBlock

  RedactedThinkingBlockParam = Anthropic::Models::RedactedThinkingBlockParam

  ServerToolUsage = Anthropic::Models::ServerToolUsage

  ServerToolUseBlock = Anthropic::Models::ServerToolUseBlock

  ServerToolUseBlockParam = Anthropic::Models::ServerToolUseBlockParam

  SignatureDelta = Anthropic::Models::SignatureDelta

  StopReason = Anthropic::Models::StopReason

  TextBlock = Anthropic::Models::TextBlock

  TextBlockParam = Anthropic::Models::TextBlockParam

  TextCitation = Anthropic::Models::TextCitation

  TextCitationParam = Anthropic::Models::TextCitationParam

  TextDelta = Anthropic::Models::TextDelta

  ThinkingBlock = Anthropic::Models::ThinkingBlock

  ThinkingBlockParam = Anthropic::Models::ThinkingBlockParam

  ThinkingConfigDisabled = Anthropic::Models::ThinkingConfigDisabled

  ThinkingConfigEnabled = Anthropic::Models::ThinkingConfigEnabled

  ThinkingConfigParam = Anthropic::Models::ThinkingConfigParam

  ThinkingDelta = Anthropic::Models::ThinkingDelta

  Tool = Anthropic::Models::Tool

  ToolBash20250124 = Anthropic::Models::ToolBash20250124

  ToolChoice = Anthropic::Models::ToolChoice

  ToolChoiceAny = Anthropic::Models::ToolChoiceAny

  ToolChoiceAuto = Anthropic::Models::ToolChoiceAuto

  ToolChoiceNone = Anthropic::Models::ToolChoiceNone

  ToolChoiceTool = Anthropic::Models::ToolChoiceTool

  ToolResultBlockParam = Anthropic::Models::ToolResultBlockParam

  ToolTextEditor20250124 = Anthropic::Models::ToolTextEditor20250124

  ToolUnion = Anthropic::Models::ToolUnion

  ToolUseBlock = Anthropic::Models::ToolUseBlock

  ToolUseBlockParam = Anthropic::Models::ToolUseBlockParam

  URLImageSource = Anthropic::Models::URLImageSource

  URLPDFSource = Anthropic::Models::URLPDFSource

  Usage = Anthropic::Models::Usage

  WebSearchResultBlock = Anthropic::Models::WebSearchResultBlock

  WebSearchResultBlockParam = Anthropic::Models::WebSearchResultBlockParam

  WebSearchTool20250305 = Anthropic::Models::WebSearchTool20250305

  WebSearchToolRequestError = Anthropic::Models::WebSearchToolRequestError

  WebSearchToolResultBlock = Anthropic::Models::WebSearchToolResultBlock

  WebSearchToolResultBlockContent =
    Anthropic::Models::WebSearchToolResultBlockContent

  WebSearchToolResultBlockParam =
    Anthropic::Models::WebSearchToolResultBlockParam

  WebSearchToolResultBlockParamContent =
    Anthropic::Models::WebSearchToolResultBlockParamContent

  WebSearchToolResultError = Anthropic::Models::WebSearchToolResultError
end
