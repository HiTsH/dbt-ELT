{% macro markup(sell_price, cost_price) %}

    ({{sell_price}} - {{cost_price}}) / {{cost_price}}

{% endmacro %}