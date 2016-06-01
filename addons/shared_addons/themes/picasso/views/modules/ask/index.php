<div id="baseurl" class="hide">{{ url:site }}</div>
<main class="askUs" style="background-image: url('addons/shared_addons/themes/picasso/img/bg.png')">
    <h1><div class="container">{{ if lang == "es"}}Pregunte al experto{{ else }}Ask to expert{{ endif }}</div><div class="icon"></div></h1>
    <div class="panel">
        <div class="container">
            {{ data:text }}
        </div>
    </div>
    <div class="container relative">
        {{ allies }}
        <div class="consultant {{uno}}" id="{{id}}">
            <figure style="background-image: url('{{image}}')"></figure>
            <div class="caption">
                <h2>{{name}}</h2>
                <div class="text">
                    {{text}}
                </div>
            </div>
        </div>
        {{ /allies }}


        <!-- FORMULARIOS -->

        <div id="loading_contacts"></div>
        <div class="s2"></div>
        <?php echo form_open(site_url('ask/send'), 'class="crud form_contac_ajax"'); ?>

        <div class="form step-1 form-active">
            <h2>{{ data:title1 }}</h2>
            <div class="text">{{ data:text1 }}</div>

            <textarea name="message" id="" cols="30" rows="10" placeholder="{{ if lang == "es" }}Escriba sus consulta...{{ else }}Write your ask...{{ endif }}"></textarea>
            <a class="btn btn-large  btnSec  right next-form">{{ if lang == "es" }}Pregunte al experto{{ else }}Ask to the expert{{ endif }}</a>
            <div class="clear"></div>

        </div>
        <div class="form step-2">
            <h2>{{ data:title2 }}</h2>
            <label for="">
                {{ if lang == "es" }}Donde necesitas ayuda{{ else }}where do you need help{{ endif }}
            </label>
            <select name="place">
                <option value="india">India</option>
                <option value="colombia">Colombia</option>
                <option value="uk">United Kingdom</option>
            </select>

            <label for="">
                {{ if lang == "es" }}Tipo de consultoría{{ else }}Type{{ endif }}
            </label>
            <select id="consultant" name="type">
                {{ allies }}
                <option value="{{id}}">{{name}}</option>
                {{ /allies }}
            </select>

            <div class="text">{{ data:text2 }}</div>
            <input type="submit" class="btn btn-large  btnSec  right " value="{{ if lang == "es" }}Continuar{{ else }}Continue{{ endif }}">
            <div class="clear"></div>

        </div>

        <?php echo form_close(); ?>

        <!-- FIN FORMULARIO -->


    </div>
</main>
<section class="quotes">
    <div class="container">
        <div class="text">
            {{ data:footer }}
        </div>
    </div>
    <div class="icon">
        <i class="fa fa-quote-left"></i>
    </div>
    <div class="icon2">
        <i class="fa fa-quote-left"></i>
    </div>
</section>