{% set vpc_region = 'eu-central-1' %}
{% set vpc_name = 'c63' %}
{% set cidr_internal = '10.10.0.0/16' %}
{% set cidr_prefix = '10.10' %}

vpc:
  name: {{ vpc_name }}
  region: {{ vpc_region }}
  cidr_internal: {{ cidr_internal }}
  cidr_prefix: {{ cidr_prefix }}

