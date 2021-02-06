# manage incoming https
class firewall::rules::https {
  include firewall
  if $firewall::use_nftables {
    include nftables::rules::https
  } else {
    include shorewall::rules::https
  }
}
