# frozen_string_literal: true

require_relative "../../../test_helper"

class Anthropic::Test::Resources::Beta::Tunnels::CertificatesTest < Anthropic::Test::ResourceTest
  def test_create_required_params
    response =
      @anthropic.beta.tunnels.certificates.create("tunnel_id", ca_certificate_pem: "ca_certificate_pem")

    assert_pattern do
      response => Anthropic::Beta::Tunnels::BetaTunnelCertificate
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        created_at: Time,
        expires_at: Time | nil,
        fingerprint: String,
        tunnel_id: String,
        type: Symbol
      }
    end
  end

  def test_retrieve_required_params
    skip("buildURL drops path-level query params (SDK-4349)")

    response = @anthropic.beta.tunnels.certificates.retrieve("certificate_id", tunnel_id: "tunnel_id")

    assert_pattern do
      response => Anthropic::Beta::Tunnels::BetaTunnelCertificate
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        created_at: Time,
        expires_at: Time | nil,
        fingerprint: String,
        tunnel_id: String,
        type: Symbol
      }
    end
  end

  def test_list
    skip("buildURL drops path-level query params (SDK-4349)")

    response = @anthropic.beta.tunnels.certificates.list("tunnel_id")

    assert_pattern do
      response => Anthropic::Internal::PageCursor
    end

    row = response.to_enum.first
    return if row.nil?

    assert_pattern do
      row => Anthropic::Beta::Tunnels::BetaTunnelCertificate
    end

    assert_pattern do
      row => {
        id: String,
        archived_at: Time | nil,
        created_at: Time,
        expires_at: Time | nil,
        fingerprint: String,
        tunnel_id: String,
        type: Symbol
      }
    end
  end

  def test_archive_required_params
    response = @anthropic.beta.tunnels.certificates.archive("certificate_id", tunnel_id: "tunnel_id")

    assert_pattern do
      response => Anthropic::Beta::Tunnels::BetaTunnelCertificate
    end

    assert_pattern do
      response => {
        id: String,
        archived_at: Time | nil,
        created_at: Time,
        expires_at: Time | nil,
        fingerprint: String,
        tunnel_id: String,
        type: Symbol
      }
    end
  end
end
