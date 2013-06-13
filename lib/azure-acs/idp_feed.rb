require 'typhoeus'
require 'erb'

module AzureACS

  class IdPFeed

    include ERB::Util

    def initialize(acs_namespace, realm, reply_to)
      raise ArgumentError.new('Azure ACS namespace cannot be null.')    if acs_namespace.nil? || acs_namespace == ''
      raise ArgumentError.new('Relying party realm cannot be null.')    if realm.nil? || realm == ''
      raise ArgumentError.new('Relying party reply_to cannot be null.') if reply_to.nil? || reply_to == ''

      realm         = url_encode(realm)
      reply_to      = url_encode(reply_to)

      url_base        = "https://#{acs_namespace}.accesscontrol.windows.net:443/v2/metadata/IdentityProviders.js"
      url_params      = "protocol=wsfederation&realm=#{realm}&reply_to=#{reply_to}&context=&request_id=&version=1.0&callback="
      @json_feed_url  = "#{url_base}?#{url_params}"
    end

    def json_feed_url
      @json_feed_url
    end

    def identity_providers
      @identity_providers ||= Typhoeus::Request.get(@json_feed_url).body
    end

  end

end

