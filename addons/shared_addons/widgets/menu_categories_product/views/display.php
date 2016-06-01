<?php
    function build_categories($rows,$module=null,$parent=0,$ban=true,$current=null, $slugFather='', $level = 1)
    {
        $classCategories = 'category';
        $classSubcategoriesFather = 'subcategoriFather';
        $classSubcategories = 'subcategory';
        $plusClass = 'plus';
        $classActive = 'Activo';
        
        $result = "<ul ".(!empty($slugFather) ? 'class="level_'.$level.' sub_'.$slugFather.'"' : 'class="list-group"').">";
        if($ban) $result.= "<li id='todos' class='list-group-item'><a href='{$module}'>Todos</a></li>";
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
                $result.= "<li id='".$row->slug.'_'.$row->id."' class='".($children ? $plusClass : '').' '.($row->parent == 0 ? $classCategories : ($children ? $classSubcategoriesFather : $classSubcategories)).' '.($row->title == $current ? $classActive : '').($level < 2 ? 'list-group-item' : '')." '>
                <a href='{$module}/index/".$row->slug."'>".$row->title."</a>";
             if ($children = true)
             {
                $result .= "<div class='ico-more'>+</div>";
                $result.= build_categories($rows,$module,$row->id,false, $current, $row->slug.'_'.$row->id, $level + 1) . "</li>";
             }
            }
        }
        $result .= "</ul>";
        return $result;
    }
    
    $menu = build_categories($categories,'products', 0, true, $current, '', 1);
?>
<?php echo $menu; ?>