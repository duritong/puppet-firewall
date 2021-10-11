# outgoing keyserver
class firewall::rules::out::keyserver {
  include firewall
  if $firewall::use_nftables {
    nftables::simplerule {
      'keyserver_out':
        chain => 'default_out',
        dport => 11371,
        proto => 'tcp';
      'keyserver_s_out':
        chain => 'default_out',
        dport => 11372,
        proto => 'tcp';
    }
  } else {
    include shorewall::rules::out::keyserver
  }
}
