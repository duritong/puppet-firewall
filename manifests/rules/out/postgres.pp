# manage outgoing postgres
class firewall::rules::out::postgres {
  include firewall
  if $firewall::use_nftables {
    include nftables::rules::out::postgres
  } else {
    include shorewall::rules::out::postgres
  }
}
