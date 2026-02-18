# typed: strong

module Anthropic
  AnthropicBeta = Anthropic::Models::AnthropicBeta

  APIErrorObject = Anthropic::Models::APIErrorObject

  AuthenticationError = Anthropic::Models::AuthenticationError

  Base64ImageSource = Anthropic::Models::Base64ImageSource

  Base64PDFSource = Anthropic::Models::Base64PDFSource

  BashCodeExecutionOutputBlock = Anthropic::Models::BashCodeExecutionOutputBlock

  BashCodeExecutionOutputBlockParam =
    Anthropic::Models::BashCodeExecutionOutputBlockParam

  BashCodeExecutionResultBlock = Anthropic::Models::BashCodeExecutionResultBlock

  BashCodeExecutionResultBlockParam =
    Anthropic::Models::BashCodeExecutionResultBlockParam

  BashCodeExecutionToolResultBlock =
    Anthropic::Models::BashCodeExecutionToolResultBlock

  BashCodeExecutionToolResultBlockParam =
    Anthropic::Models::BashCodeExecutionToolResultBlockParam

  BashCodeExecutionToolResultError =
    Anthropic::Models::BashCodeExecutionToolResultError

  BashCodeExecutionToolResultErrorCode =
    Anthropic::Models::BashCodeExecutionToolResultErrorCode

  BashCodeExecutionToolResultErrorParam =
    Anthropic::Models::BashCodeExecutionToolResultErrorParam

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

  CacheCreation = Anthropic::Models::CacheCreation

  CitationCharLocation = Anthropic::Models::CitationCharLocation

  CitationCharLocationParam = Anthropic::Models::CitationCharLocationParam

  CitationContentBlockLocation = Anthropic::Models::CitationContentBlockLocation

  CitationContentBlockLocationParam =
    Anthropic::Models::CitationContentBlockLocationParam

  CitationPageLocation = Anthropic::Models::CitationPageLocation

  CitationPageLocationParam = Anthropic::Models::CitationPageLocationParam

  CitationsConfig = Anthropic::Models::CitationsConfig

  CitationsConfigParam = Anthropic::Models::CitationsConfigParam

  CitationsDelta = Anthropic::Models::CitationsDelta

  CitationSearchResultLocationParam =
    Anthropic::Models::CitationSearchResultLocationParam

  CitationsSearchResultLocation =
    Anthropic::Models::CitationsSearchResultLocation

  CitationsWebSearchResultLocation =
    Anthropic::Models::CitationsWebSearchResultLocation

  CitationWebSearchResultLocationParam =
    Anthropic::Models::CitationWebSearchResultLocationParam

  CodeExecutionOutputBlock = Anthropic::Models::CodeExecutionOutputBlock

  CodeExecutionOutputBlockParam =
    Anthropic::Models::CodeExecutionOutputBlockParam

  CodeExecutionResultBlock = Anthropic::Models::CodeExecutionResultBlock

  CodeExecutionResultBlockParam =
    Anthropic::Models::CodeExecutionResultBlockParam

  CodeExecutionTool20250522 = Anthropic::Models::CodeExecutionTool20250522

  CodeExecutionTool20250825 = Anthropic::Models::CodeExecutionTool20250825

  CodeExecutionTool20260120 = Anthropic::Models::CodeExecutionTool20260120

  CodeExecutionToolResultBlock = Anthropic::Models::CodeExecutionToolResultBlock

  CodeExecutionToolResultBlockContent =
    Anthropic::Models::CodeExecutionToolResultBlockContent

  CodeExecutionToolResultBlockParam =
    Anthropic::Models::CodeExecutionToolResultBlockParam

  CodeExecutionToolResultBlockParamContent =
    Anthropic::Models::CodeExecutionToolResultBlockParamContent

  CodeExecutionToolResultError = Anthropic::Models::CodeExecutionToolResultError

  CodeExecutionToolResultErrorCode =
    Anthropic::Models::CodeExecutionToolResultErrorCode

  CodeExecutionToolResultErrorParam =
    Anthropic::Models::CodeExecutionToolResultErrorParam

  Completion = Anthropic::Models::Completion

  CompletionCreateParams = Anthropic::Models::CompletionCreateParams

  Container = Anthropic::Models::Container

  ContainerUploadBlock = Anthropic::Models::ContainerUploadBlock

  ContainerUploadBlockParam = Anthropic::Models::ContainerUploadBlockParam

  ContentBlock = Anthropic::Models::ContentBlock

  ContentBlockParam = Anthropic::Models::ContentBlockParam

  ContentBlockSource = Anthropic::Models::ContentBlockSource

  ContentBlockSourceContent = Anthropic::Models::ContentBlockSourceContent

  DirectCaller = Anthropic::Models::DirectCaller

  DocumentBlock = Anthropic::Models::DocumentBlock

  DocumentBlockParam = Anthropic::Models::DocumentBlockParam

  EncryptedCodeExecutionResultBlock =
    Anthropic::Models::EncryptedCodeExecutionResultBlock

  EncryptedCodeExecutionResultBlockParam =
    Anthropic::Models::EncryptedCodeExecutionResultBlockParam

  ErrorObject = Anthropic::Models::ErrorObject

  ErrorResponse = Anthropic::Models::ErrorResponse

  GatewayTimeoutError = Anthropic::Models::GatewayTimeoutError

  ImageBlockParam = Anthropic::Models::ImageBlockParam

  InputJSONDelta = Anthropic::Models::InputJSONDelta

  InvalidRequestError = Anthropic::Models::InvalidRequestError

  JSONOutputFormat = Anthropic::Models::JSONOutputFormat

  MemoryTool20250818 = Anthropic::Models::MemoryTool20250818

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

  OutputConfig = Anthropic::Models::OutputConfig

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

  SearchResultBlockParam = Anthropic::Models::SearchResultBlockParam

  ServerToolCaller = Anthropic::Models::ServerToolCaller

  ServerToolCaller20260120 = Anthropic::Models::ServerToolCaller20260120

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

  TextEditorCodeExecutionCreateResultBlock =
    Anthropic::Models::TextEditorCodeExecutionCreateResultBlock

  TextEditorCodeExecutionCreateResultBlockParam =
    Anthropic::Models::TextEditorCodeExecutionCreateResultBlockParam

  TextEditorCodeExecutionStrReplaceResultBlock =
    Anthropic::Models::TextEditorCodeExecutionStrReplaceResultBlock

  TextEditorCodeExecutionStrReplaceResultBlockParam =
    Anthropic::Models::TextEditorCodeExecutionStrReplaceResultBlockParam

  TextEditorCodeExecutionToolResultBlock =
    Anthropic::Models::TextEditorCodeExecutionToolResultBlock

  TextEditorCodeExecutionToolResultBlockParam =
    Anthropic::Models::TextEditorCodeExecutionToolResultBlockParam

  TextEditorCodeExecutionToolResultError =
    Anthropic::Models::TextEditorCodeExecutionToolResultError

  TextEditorCodeExecutionToolResultErrorCode =
    Anthropic::Models::TextEditorCodeExecutionToolResultErrorCode

  TextEditorCodeExecutionToolResultErrorParam =
    Anthropic::Models::TextEditorCodeExecutionToolResultErrorParam

  TextEditorCodeExecutionViewResultBlock =
    Anthropic::Models::TextEditorCodeExecutionViewResultBlock

  TextEditorCodeExecutionViewResultBlockParam =
    Anthropic::Models::TextEditorCodeExecutionViewResultBlockParam

  ThinkingBlock = Anthropic::Models::ThinkingBlock

  ThinkingBlockParam = Anthropic::Models::ThinkingBlockParam

  ThinkingConfigAdaptive = Anthropic::Models::ThinkingConfigAdaptive

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

  ToolReferenceBlock = Anthropic::Models::ToolReferenceBlock

  ToolReferenceBlockParam = Anthropic::Models::ToolReferenceBlockParam

  ToolResultBlockParam = Anthropic::Models::ToolResultBlockParam

  ToolSearchToolBm25_20251119 = Anthropic::Models::ToolSearchToolBm25_20251119

  ToolSearchToolRegex20251119 = Anthropic::Models::ToolSearchToolRegex20251119

  ToolSearchToolResultBlock = Anthropic::Models::ToolSearchToolResultBlock

  ToolSearchToolResultBlockParam =
    Anthropic::Models::ToolSearchToolResultBlockParam

  ToolSearchToolResultError = Anthropic::Models::ToolSearchToolResultError

  ToolSearchToolResultErrorCode =
    Anthropic::Models::ToolSearchToolResultErrorCode

  ToolSearchToolResultErrorParam =
    Anthropic::Models::ToolSearchToolResultErrorParam

  ToolSearchToolSearchResultBlock =
    Anthropic::Models::ToolSearchToolSearchResultBlock

  ToolSearchToolSearchResultBlockParam =
    Anthropic::Models::ToolSearchToolSearchResultBlockParam

  ToolTextEditor20250124 = Anthropic::Models::ToolTextEditor20250124

  ToolTextEditor20250429 = Anthropic::Models::ToolTextEditor20250429

  ToolTextEditor20250728 = Anthropic::Models::ToolTextEditor20250728

  ToolUnion = Anthropic::Models::ToolUnion

  ToolUseBlock = Anthropic::Models::ToolUseBlock

  ToolUseBlockParam = Anthropic::Models::ToolUseBlockParam

  URLImageSource = Anthropic::Models::URLImageSource

  URLPDFSource = Anthropic::Models::URLPDFSource

  Usage = Anthropic::Models::Usage

  WebFetchBlock = Anthropic::Models::WebFetchBlock

  WebFetchBlockParam = Anthropic::Models::WebFetchBlockParam

  WebFetchTool20250910 = Anthropic::Models::WebFetchTool20250910

  WebFetchTool20260209 = Anthropic::Models::WebFetchTool20260209

  WebFetchToolResultBlock = Anthropic::Models::WebFetchToolResultBlock

  WebFetchToolResultBlockParam = Anthropic::Models::WebFetchToolResultBlockParam

  WebFetchToolResultErrorBlock = Anthropic::Models::WebFetchToolResultErrorBlock

  WebFetchToolResultErrorBlockParam =
    Anthropic::Models::WebFetchToolResultErrorBlockParam

  WebFetchToolResultErrorCode = Anthropic::Models::WebFetchToolResultErrorCode

  WebSearchResultBlock = Anthropic::Models::WebSearchResultBlock

  WebSearchResultBlockParam = Anthropic::Models::WebSearchResultBlockParam

  WebSearchTool20250305 = Anthropic::Models::WebSearchTool20250305

  WebSearchTool20260209 = Anthropic::Models::WebSearchTool20260209

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
