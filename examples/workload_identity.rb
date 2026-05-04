#!/usr/bin/env ruby
# frozen_string_literal: true

# Workload Identity Federation & Credential Providers examples.
#
# The Anthropic client resolves auth in this precedence order:
#   1. Constructor args: api_key:, auth_token:, or credentials:
#   2. Env vars: ANTHROPIC_API_KEY, ANTHROPIC_AUTH_TOKEN, then the credential chain below
#   3. Standard defaults: ~/.config/anthropic/credentials.json if it exists
#
# The `credentials:` arg accepts any AccessTokenProvider — a callable returning
# AccessToken.new(token:, expires_at:). The client caches the token and proactively
# refreshes it (120s advisory / 30s mandatory before expiry).
#
# Running this file as-is uses the zero-config path (`Anthropic::Client.new`).
# To try one of the other strategies, swap the `build_client` call at the bottom
# for one of the other `build_client_*` methods defined below.

require_relative "../lib/anthropic"

# =============================================================================
# Zero-config (recommended for production workloads)
# =============================================================================
# Just construct the client. Auth is resolved from the environment.
#
# For Kubernetes / GitHub Actions / etc., set these env vars on the workload:
#   ANTHROPIC_IDENTITY_TOKEN_FILE=/var/run/secrets/kubernetes.io/serviceaccount/token
#     — or, if you have the JWT inline rather than on disk, set instead:
#   ANTHROPIC_IDENTITY_TOKEN=<the OIDC JWT>
#     (when both are set, the file wins — it supports rotation)
#   ANTHROPIC_FEDERATION_RULE_ID=fdrl_01...
#   ANTHROPIC_ORGANIZATION_ID=00000000-0000-0000-0000-000000000000
#   ANTHROPIC_SERVICE_ACCOUNT_ID=svac_01...   (optional)
#
# Or, if a sidecar/daemon writes a profile config + credentials file:
#   ANTHROPIC_PROFILE=my-profile     (picks ~/.config/anthropic/configs/my-profile.json
#                                     and ~/.config/anthropic/credentials/my-profile.json)
#   ANTHROPIC_CONFIG_DIR=/etc/anthropic   (relocates the root; optional)
#
# Or, the existing env vars still work:
#   ANTHROPIC_API_KEY=sk-ant-...
#   ANTHROPIC_AUTH_TOKEN=sk-ant-oat01-...
def build_client
  Anthropic::Client.new
end

# =============================================================================
# WorkloadIdentity: exchange an external OIDC JWT
# =============================================================================

# JWT source option i: read from a file (re-read on every refresh — handles k8s rotation)
def build_client_wif_file
  Anthropic::Client.new(
    credentials: Anthropic::Credentials::WorkloadIdentity.new(
      identity_token_provider: Anthropic::Credentials::IdentityTokenFile.new(
        "/var/run/secrets/kubernetes.io/serviceaccount/token"
      ),
      federation_rule_id: "fdrl_01...",
      organization_id: "00000000-0000-0000-0000-000000000000",
      service_account_id: "svac_01..."
    )
  )
end

# JWT source option ii: from an env var (CI systems that inject the token directly)
def build_client_wif_env
  Anthropic::Client.new(
    credentials: Anthropic::Credentials::WorkloadIdentity.new(
      identity_token_provider: -> { ENV.fetch("ANTHROPIC_IDENTITY_TOKEN") },
      federation_rule_id: "fdrl_01...",
      organization_id: "00000000-0000-0000-0000-000000000000"
    )
  )
end

# JWT source option iii: custom callable (secrets manager, internal token service, etc.)
def fetch_jwt_from_vault
  # your logic here
  ""
end

def build_client_wif_custom
  Anthropic::Client.new(
    credentials: Anthropic::Credentials::WorkloadIdentity.new(
      identity_token_provider: method(:fetch_jwt_from_vault),
      federation_rule_id: "fdrl_01...",
      organization_id: "00000000-0000-0000-0000-000000000000"
    )
  )
end

# =============================================================================
# CredentialsFile: read auth config from a named profile on disk
# =============================================================================
#
# Profiles live under the config directory (default ~/.config/anthropic/,
# override with ANTHROPIC_CONFIG_DIR) as a pair of files:
#
#   configs/<profile>.json       — non-secret. Shape:
#
#     {
#       "authentication": {"type": "oidc_federation"|"user_oauth", ...},
#       "organization_id": "00000000-0000-0000-0000-000000000000",
#       "workspace_id": "wrkspc_01...",
#       "base_url": "https://api.anthropic.com"
#     }
#
#   The "authentication" object is a tagged union discriminated on "type":
#
#     {"type": "oidc_federation",
#      "federation_rule_id": "fdrl_...",
#      "service_account_id": "svac_...",
#      "identity_token": {"source": "file", "path": "..."}}
#       → SDK performs the jwt-bearer exchange itself. If "identity_token"
#         is omitted, ANTHROPIC_IDENTITY_TOKEN_FILE is used instead.
#         organization_id is read from the top level of the config.
#
#     {"type": "user_oauth", "client_id": "..."}
#       → interactive PKCE login with refresh_token rotation. On access-token
#         expiry the SDK performs a refresh_token grant against
#         /v1/oauth/token and writes the new tokens back to
#         credentials/<profile>.json (atomic replace).
#
#     {"type": "user_oauth"}  (no client_id)
#       → credentials file is externally rotated by a sidecar/daemon. The
#         SDK re-reads the file on every refresh and returns whatever
#         access_token is there; no refresh grant is attempted.
#
#   credentials/<profile>.json   — secret (0600). Holds access_token,
#                                  expires_at, and (for user_oauth with
#                                  a client_id) refresh_token.

# Point at a specific profile name:
def build_client_profile_named
  Anthropic::Client.new(credentials: Anthropic::Credentials::CredentialsFile.new("production"))
end

# Or resolve the profile from ANTHROPIC_PROFILE / <config_dir>/active_config / "default":
def build_client_profile_default
  Anthropic::Client.new(credentials: Anthropic::Credentials::CredentialsFile.new)
end

# =============================================================================
# StaticToken: you already have a bearer token
# =============================================================================
# (equivalent to `Anthropic::Client.new(auth_token: "sk-ant-oat01-...")`)
def build_client_static_token
  Anthropic::Client.new(credentials: Anthropic::Credentials::StaticToken.new("sk-ant-oat01-..."))
end

# =============================================================================
# Custom AccessTokenProvider
# =============================================================================
# Any callable matching AccessTokenProvider works. The optional `force_refresh:`
# kwarg is set after a 401 retry; providers without a cache can ignore it.
def build_client_custom_provider
  my_provider = ->(_force_refresh: false) {
    # call your internal auth service here
    Anthropic::Credentials::AccessToken.new(token: "sk-ant-oat01-...", expires_at: 1_775_000_000)
  }
  Anthropic::Client.new(credentials: my_provider)
end

# =============================================================================
# Run the example
# =============================================================================
# Swap `build_client` for any of the `build_client_*` variants above to try them.

client = build_client

response = client.messages.create(
  model: "claude-sonnet-4-5-20250929",
  max_tokens: 1024,
  messages: [{role: "user", content: "Hello"}]
)
puts response.content
