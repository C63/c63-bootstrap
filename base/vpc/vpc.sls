{% set vpc_name = salt['pillar.get']('vpc:name') %}
{% set region = salt['pillar.get']('vpc:region') %}
{% set cidr_internal = salt['pillar.get']('vpc:cidr_internal') %}

{% set igw_name = salt['pillar.get']('vpc:igw_name') %}

Ensure VPC exists:
  boto_vpc.present:
    - name: {{ vpc_name }}
    - cidr_block: {{ cidr_internal }}
    - dns_hostnames: True
    - region: {{ region }}

Ensure internet gateway exists:
  boto_vpc.internet_gateway_present:
    - name: {{ igw_name }}
    - vpc_name: {{ vpc_name }}
    - region: {{ region }}

