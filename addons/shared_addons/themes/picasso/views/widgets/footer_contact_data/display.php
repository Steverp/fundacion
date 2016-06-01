<div class="contact-info">
    {{ if data:adress }}<div><i class="fa fa-map-marker"></i>{{data:adress}}</div>{{ endif }}
    {{ if data:email }}<div><i class="fa fa-envelope"></i><a href="mailto:{{ data:email }}">{{ data:email }}</a></div>{{ endif }}
    {{ if data:phone }}<div><i class="fa fa-mobile"></i>{{ data:phone }}</div>{{ endif }}
</div>
<!--
<div class="text">
    {{ data:schedule }}
</div>-->
