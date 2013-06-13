require 'spec_helper'
require 'erb'

describe AzureACS::IdPFeed do

  describe 'Initialization' do

    let(:acs_namespace) { 'example' }
    let(:realm) { 'https://rp.example.com/app_name' }
    let(:reply_to) { 'https://rp.example.com/auth/wsfed' }

    context 'with invalid ctor params' do

      it 'should raise an exception when ACS namespaces is nil or empty' do
        expect { described_class.new(nil, realm, reply_to) }.to raise_error ArgumentError
        expect { described_class.new('', realm, reply_to) }.to raise_error ArgumentError
      end

      it 'should raise an exception when relying party realm is nil or empty' do
        expect { described_class.new(acs_namespace, nil, reply_to) }.to raise_error ArgumentError
        expect { described_class.new(acs_namespace, '', reply_to) }.to raise_error ArgumentError
      end

      it 'should raise an exception when relying party reply_to is nil or empty' do
        expect { described_class.new(acs_namespace, realm, nil) }.to raise_error ArgumentError
        expect { described_class.new(acs_namespace, realm, '') }.to raise_error ArgumentError
      end

    end

    context 'valid ctor params' do

      it 'should set the JSON Feed URL property' do
        described_class.new(acs_namespace, realm, reply_to).json_feed_url.should_not be_nil
      end

      it 'should url_encode realm and reply_to' do
        url_base                = "https://#{acs_namespace}.accesscontrol.windows.net:443/v2/metadata/IdentityProviders.js"
        url_params              = "protocol=wsfederation&realm=#{ERB::Util.url_encode(realm)}&reply_to=#{ERB::Util.url_encode(reply_to)}&context=&request_id=&version=1.0&callback="
        expected_json_feed_url  = "#{url_base}?#{url_params}"

        described_class.new(acs_namespace, realm, reply_to).json_feed_url.should == expected_json_feed_url
      end

    end

  end

end