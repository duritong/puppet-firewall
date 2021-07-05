# outgoing tor
class firewall::rules::out::tor {
  include firewall
  if $firewall::use_nftables {
    include nftables::rules::out::tor
  } else {
    include shorewall::rules::out::tor
  }
}
