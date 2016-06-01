<main class="faq">
    <div class="wrapper grid">
        <h1>Preguntas Frecuentes</h1>
        <div class="wrapper">{{intro.text}}</div>
        <hr>
        <div class="tabs">
            <ul class="myTabs" role="tablist">
                {{categories}}
                <li class="{{active}}">
                    <a href="#faq{{id}}" role="tab" data-toggle="tab">
                        {{title}}<i class="fa fa-chevron-right"></i>
                    </a>
                </li>
                {{/categories}}
            </ul>
        </div>
        <div class="tab-content">
            {{categories}}
            <div class="tab-pane {{active}}"  id="faq{{id}}" >
                <div class="bussines-list " id="upload_items">
                    {{ preguntas }}
                    <div class="tab-pane">
                        <article>
                            <h2>{{ nombre }}<i class="fa fa-chevron-right"></i></h2>
                            <div class="text">{{ description }}</div>
                        </article>
                    </div>
                    {{ /preguntas }}
                </div>
            </div>
            {{/categories}}
        </div>
    </div>

    <div class="panel">        
</main>