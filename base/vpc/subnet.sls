{% set vpc_name = salt['pillar.get']('vpc:name') %}
{% set region = salt['pillar.get']('vpc:region') %}

{% for sn in salt['pillar.get']('vpc:subnet') %}
Ensure {{ sn['name'] }} subnet exists:
  boto_vpc.subnet_present:
    - name: {{ sn['name'] }}
    - vpc_name: {{ vpc_name }}
    - cidr_block: {{ sn['cidr_block'] }}
    - region: {{ region }}
{% endfor %}

