require 'ipaddr'
# Checks if the value of an attribute is a valid IP address.
#
# @example Validate that the device IP address is valid.
#   class Host << ActiveRecord::Base
#     attr_accessor :ip
#     validates :ip, ip_address: true
#   end
class IpAddressValidator < BaseValidator
  private

  def valid?(ip_address, _)
    begin
      if ip_address.is_a? IPAddr
        true
      else
        IPAddr.new(ip_address)
      end
    rescue IPAddr::InvalidAddressError, IPAddr::AddressFamilyError => e
      false
    end
  end
end
