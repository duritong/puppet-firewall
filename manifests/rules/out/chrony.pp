# manage outgoing time protocol
class firewall::rules::out::chrony {
  include firewall
  if $firewall::use_nftables {
    include nftables::rules::out::chrony
  } else {
    include shorewall::rules::ntp::client
  }
}
