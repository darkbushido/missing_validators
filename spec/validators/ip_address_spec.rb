require 'spec_helper'

describe IpAddressValidator do
  let(:klass) do
    Class.new do
      include ActiveModel::Validations
      attr_accessor :ip, :name
      validates :ip, ip_address: true
    end
  end

  subject { klass.new }

  it { is_expected.to ensure_valid_ip_address_format_of(:ip) }
  it { is_expected.not_to ensure_valid_ip_address_format_of(:name) }

  context 'when IP-Address is valid' do
    it { is_expected.to allow_value('10.7.177.254').for(:ip) }
    it { is_expected.to allow_value('8.8.8.8').for(:ip) }
  end

  it { is_expected.not_to allow_value('invalid').for(:ip) }
end
