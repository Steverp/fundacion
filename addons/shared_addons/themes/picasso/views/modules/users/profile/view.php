<section class="cont_home m_b_30">
    <section class="marco">
        <!--Titulo-->
        <div class="titulos animated fadeInDown">
            <h1>{{ user:display_name user_id= _user:id }}</h1>
        </div>
        <div class="clear"></div>
        <section class="cont_nosotros" id="user_profile">
            <div class="large-3 medium-3 small-12 columns wow fadeInUp img_perfil p_r_40" data-wow-delay="0.1s">
                <div class="img_porfil">
                    <?php echo gravatar($_user->email, 200); ?>
                </div>	
                <!-- Container for the user's profile -->						
                <a class="btn_gris" href="{{ url:site uri='edit-profile' }}">
                    <i class="fa fa-pencil-square-o"></i> {{ helper:lang line="edit_profile_label" }}
                </a>
            </div>
            <div class="large-9 medium-9 small-12 columns wow fadeInUp p_l_20" data-wow-delay="0.2s">

                <table class="responsive">
                    {{# we use _user:id as that is the id passed to this view. Different than the logged in user's user:id #}}
                    {{ user:profile_fields user_id= _user:id }}
                    {{#   viewing own profile?    are they an admin? ok it's a regular user, we'll show the non-sensitive items #}}
                    {{ if user:id === _user:id or user:group === 'admin' or slug != 'email' and slug != 'first_name' and slug != 'last_name' and slug != 'username' and value }}
                    <tr>
                        <td><strong>{{ name }}:</strong></td>
                        <td width="80%">{{ value }}</td>
                    </tr>
                    {{ endif }}
                    {{ /user:profile_fields }}
                </table>

            </div>

            <div class="large-12 medium-12 small-12 columns m_b_40">
                <p>{{ data:text }}</p>
            </div>
        </section>
    </section> 
</section>

