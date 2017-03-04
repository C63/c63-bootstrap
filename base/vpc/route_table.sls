{% set vpc_name = salt['pillar.get']('vpc:name') %}
{% set region = salt['pillar.get']('vpc:region') %}
{% set cidr_internal = salt['pillar.get']('vpc:cidr_internal') %}
{% set igw_name = salt['pillar.get']('vpc:igw_name') %}

Ensure public route table exists:
  boto_vpc.route_table_present:
    - name: c63-public-table
    - vpc_name: {{ vpc_name }}
    - routes:
      - destination_cidr_block: 0.0.0.0/0
        internet_gateway_name: {{ igw_name }}
    - subnet_names:
      - public
    - region: {{ region }}
