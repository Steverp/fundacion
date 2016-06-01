<div class="subnav">
    <?php
    function build_categories_header($rows,$module=null,$parent=0,$ban=true,$current=null, $slugFather='', $level = 1)
    {
        $classCategories = 'category';
        $classSubcategoriesFather = 'subcategoriFather';
        $classSubcategories = 'subcategory';
        $plusClass = 'plus';
        $classActive = 'Activo';

        $result = "<ul ".(!empty($slugFather) ? 'class="level_'.$level.' sub_'.$slugFather.'"' : 'class=""').">";
        //if($ban) $result.= "<li id='todos' class='list-group-item'><a href='".site_url()."{$module}'>Todos</a></li>";
        foreach ($rows as $row)
        {
            if ($row->parent == $parent)
            {
                foreach ($rows as $subrow)
                {
                    if ($subrow->parent == $row->id)
                     $children = true;
                 else $children = false;
                }
                $result.= "<li id='".$row->slug.'_'.$row->id."' class='".($children ? $plusClass : '').' '.($row->parent == 0 ? $classCategories : ($children ? $classSubcategoriesFather : $classSubcategories)).' '.($row->title == $current ? $classActive : '').($level < 2 ? 'subnavdos' : '')." '>
                <a href='".site_url()."{$module}/index/".$row->slug."' class='link_lvl_".$level."'>".$row->title."</a>";
             if ($children = true)
             {
                $result .= "";
                $result.= build_categories_header($rows,$module,$row->id,false, $current, $row->slug.'_'.$row->id, $level + 1) . "</li>";
             }
            }
        }
        $result .= "<div class='clear'></div></ul>";
        return $result;
    }

    $menu = build_categories_header($categories,'products', 0, true, $current, '', 1);
    echo $menu;

?>
</div>