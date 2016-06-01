<div class="row">
    <div class="redes">  
        {{ if data:facebook }}        
          <a class="face" href="{{data:facebook}}" target="_blank"><i class="fa fa-facebook"></i></a> 
        {{ endif }}   
        {{ if data:twitter }}        
          <a class="twitter" href="{{data:twitter}}" target="_blank"><i class="fa fa-twitter"></i></a>
        {{ endif }}
        {{ if data:linkedin }}
          <a class="linkedin" href="{{data:linkedin}}" target="_blank"><i class="fa fa-linkedin"></i></a>
        {{ endif }}
     </div>
         <div class="clear"></div>
       {{ if data:adress }} {{data:adress}} {{ endif }}  {{ if data:phone }} - {{ data:phone }} {{ endif }} {{ if data:email }} - <a href="mailto:{{ data:email }}">{{ data:email }}</a> {{ endif }}      
</div>


