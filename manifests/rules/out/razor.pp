# outgoing razor
class firewall::rules::out::razor {
  include firewall
  if $firewall::use_nftables {
    nftables::rule {
      'default_out-razor':
        content => 'tcp dport 2703 accept',
    }
  } else {
    include shorewall::rules::out::razor
  }
}
