<ul class="primary-nav">

    <li id="dashboard-link"><?php echo anchor('admin/home', 'Home', 'class="top-link ' . (!$this->module ? 'current ' : '') . '"') ?></li>
 <!--     <li id="dashboard-link"><?php echo anchor('admin/products', 'Productos', 'class="top-link ' . (!$this->module ? 'current ' : '') . '"') ?></li>
     <li id="dashboard-link"><?php echo anchor('admin/services', 'Servicios', 'class="top-link ' . (!$this->module ? 'current ' : '') . '"') ?></li>
     <li id="dashboard-link"><?php echo anchor('admin/our_clients', 'Nuestros Clientes', 'class="top-link ' . (!$this->module ? 'current ' : '') . '"') ?></li>
     <li id="dashboard-link"><?php echo anchor('admin/gallerys', 'Sala de Prensa imagenes', 'class="top-link ' . (!$this->module ? 'current ' : '') . '"') ?></li>
     <li id="dashboard-link"><?php echo anchor('admin/gallery_vi', 'Sala de Prensa videos', 'class="top-link ' . (!$this->module ? 'current ' : '') . '"') ?></li>
     <li id="dashboard-link"><?php echo anchor('admin/contact_us', 'Contactos', 'class="top-link ' . (!$this->module ? 'current ' : '') . '"') ?></li>-->

    <?php
    // Display the menu items.
    // We have already vetted them for permissions
    // in the Admin_Controller, so we can just
    // display them now.
    foreach ($menu_items as $key => $menu_item) {
        if (is_array($menu_item)) {
            if ($key == "Contenido") {
                foreach ($menu_item as $lang_key => $uri) {
                    if ($uri != 'admin/home') {
                        echo '<li><a href="' . site_url($uri) . '" class="">' . lang_label($lang_key) . '</a></li>';
                    }
                }
            } else {
                echo '<li><a class="top-link">' . lang_label($key) . '</a><ul>';
                foreach ($menu_item as $lang_key => $uri) {
                    echo '<li><a href="' . site_url($uri) . '" class="">' . lang_label($lang_key) . '</a></li>';
                }

                echo '</ul></li>';
            }
        } elseif (is_array($menu_item) and count($menu_item) == 1) {
            foreach ($menu_item as $lang_key => $uri) {
                echo '<li><a href="' . site_url($menu_item) . '" class="top-link no-submenu">' . lang_label($lang_key) . '</a></li>';
            }
        } elseif (is_string($menu_item)) {
            echo '<li><a href="' . site_url($menu_item) . '" class="top-link no-submenu">' . lang_label($key) . '</a></li>';
        }
    }
    ?>

</ul>
<!--
<ul class="primary-nav">
        
        <li id="dashboard-link"><?php echo anchor('admin', 'Leads', 'class="top-link ' . (!$this->module ? 'current ' : '') . '"') ?></li>
        

<?php
// Display the menu items.
// We have already vetted them for permissions
// in the Admin_Controller, so we can just
// display them now.
foreach ($menu_items as $key => $menu_item) {
    if (is_array($menu_item)) {
        //if($this->current_user->group_id == '1')
        //echo '<li><a class="top-link">'.lang_label($key).'</a><ul>';
        //echo '<li><a href="'.current_url().'#" class="top-link">'.lang_label($key).'</a><ul>';
        foreach ($menu_item as $lang_key => $uri) {
            echo '<li><a href="' . site_url($uri) . '" class="">' . lang_label($lang_key) . '</a></li>';
        }

        echo '<li><a href="' . site_url('edit-profile') . '" class="">Editar Perfil</a></li><li><a href="' . site_url('admin/logout') . '" class="">Cerrar Sesión</a></li></ul></li>';
    } elseif (is_array($menu_item) and count($menu_item) == 1) {
        foreach ($menu_item as $lang_key => $uri) {
            echo '<li><a href="' . site_url($menu_item) . '" class="top-link no-submenu">' . lang_label($lang_key) . '</a></li>';
        }
    } elseif (is_string($menu_item)) {
        echo '<li><a href="' . site_url($menu_item) . '" class="top-link no-submenu">' . lang_label($key) . '</a></li>';
    }
}
?>

</ul>-->