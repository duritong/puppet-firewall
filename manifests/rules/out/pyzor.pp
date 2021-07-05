# outgoing pyzor
class firewall::rules::out::pyzor {
  include firewall
  if $firewall::use_nftables {
    nftables::rule {
      'default_out-pyzor':
        content => 'udp dport 24441 accept',
    }
  } else {
    include shorewall::rules::out::pyzor
  }
}
