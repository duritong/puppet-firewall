# outgoing pop3
class firewall::rules::out::pop3 {
  include firewall
  if $firewall::use_nftables {
    include nftables::rules::out::pop3
  } else {
    include shorewall::rules::out::pop3
  }
}
