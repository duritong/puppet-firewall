# manage incoming pop3
class firewall::rules::pop3 {
  include firewall
  if $firewall::use_nftables {
    nftables::rule {
      'default_in-pop3':
        content => 'tcp dport {110, 995} accept',
    }
  } else {
    include shorewall::rules::pop3
  }
}
