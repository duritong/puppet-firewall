# outgoing smtp
class firewall::rules::out::smtp {
  include firewall
  if $firewall::use_nftables {
    include nftables::rules::out::smtp
  } else {
    include shorewall::rules::out::smtp
  }
}
