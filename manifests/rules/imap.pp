# manage incoming imap
class firewall::rules::imap {
  include firewall
  if $firewall::use_nftables {
    nftables::rule {
      'default_in-imap':
        content => 'tcp dport {143, 993} accept',
    }
  } else {
    include shorewall::rules::imap
  }
}
