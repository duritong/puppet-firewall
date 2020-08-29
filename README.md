# firewall module

This module dispatches between shorewall and nftables, depending on what you like to use.

It should be a simple and small shim, so that modules requiring to have firewall rules in place should not care about which implemention is used.
