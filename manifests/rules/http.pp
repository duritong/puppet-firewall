# manage incoming http
class firewall::rules::http {
  include firewall
  if $firewall::use_nftables {
    include nftables::rules::http
  } else {
    include shorewall::rules::http
  }
}
