# manage incoming smtp
class firewall::rules::smtp {
  include firewall
  if $firewall::use_nftables {
    include nftables::rules::smtp
  } else {
    include shorewall::rules::smtp
  }
}
