# outgoing imap
class firewall::rules::out::imap {
  include firewall
  if $firewall::use_nftables {
    include nftables::rules::out::imap
  } else {
    include shorewall::rules::out::imap
  }
}
