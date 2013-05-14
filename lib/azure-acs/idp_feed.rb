module AzureACS

  class IdPFeed

    def initialize(acs_namespace)
      raise ArgumentError.new('Azure ACS JSON feed URL cannot be null.') if idp_json_feed_url.nil?

      url_base = "https://#{acs_namespace}.accesscontrol.windows.net:443/v2/metadata/IdentityProviders.js?"
      url_params = "protocol=wsfederation&realm=http%3a%2f%2frp.onlifehealth.com%2fliveon&reply_to=http%3a%2f%2fint.obijohn.com%2fuser%2fauth%2fwsfed%2fcallback&context=&request_id=&version=1.0&callback="
      @json_feed_url = idp_json_feed_url
    end

    def identity_providers
      @json_feed ||= Typhoeus::Request.get(@json_feed_url).body
    end

  end

end

