{% from 'vpc/public_constants.sls' import cidr_internal %}

vpc:
  secgroup:
    - name: nat-egress
      description: Outgoing traffic from vpc
      rule:
        - ip_protocol: tcp
          from_port: 80
          to_port: 80
          cidr_ip: {{ cidr_internal }}
        - ip_protocol: tcp
          from_port: 443
          to_port: 443
          cidr_ip: {{ cidr_internal }}
    - name: default-internal
      description: default to allow http(s), ssh, icmp, salt from inside vpc
      rule:
        - ip_protocol: tcp
          from_port: 80
          to_port: 80
          cidr_ip: {{ cidr_internal }}
        - ip_protocol: tcp
          from_port: 443
          to_port: 443
          cidr_ip: {{ cidr_internal }}
        - ip_protocol: tcp
          from_port: 22
          to_port: 22
          cidr_ip: {{ cidr_internal }}
        - ip_protocol: tcp
          from_port: 4505
          to_port: 4506
          cidr_ip: {{ cidr_internal }}
        - ip_protocol: icmp
          from_port: -1
          to_port: -1
          cidr_ip: {{ cidr_internal }}

