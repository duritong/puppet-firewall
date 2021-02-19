# manage incoming dns
class firewall::rules::dns {
  include firewall
  if $firewall::use_nftables {
    include nftables::rules::dns
  } else {
    include shorewall::rules::dns
  }
}
