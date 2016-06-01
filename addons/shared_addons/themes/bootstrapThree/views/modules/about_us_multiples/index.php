<section class="cont_home m_b_40">
    <!--Titulo-->
   	<div class="titulos animated fadeInDown marco">
        <h1>Quiénes Somos</h1>
    </div>
      <div class="clear"></div>
    <section class="cont_nosotros">
    	<!--Item Tab-->
    	<section class="large-12 medium-12 small-12 columns m_b_20 nosotros_items">
    		<ul class="marco">
    			<?php 
					$first = true;
					if(!empty($about_us_multiples)):
						foreach($about_us_multiples AS $item): ?>
							  <li <?php echo ($first ? 'class=""' : '' ); ?> >
								<a href="#about_us<?php echo $item->id; ?>">
									<?php echo $item->title; ?>
								</a>
							  </li>
							<?php
							$first = false;
						endforeach; 
				endif; ?>
			</ul>
		</section>
		<!--Fin Item Tab-->
		<!-- Contenidos Tab -->
		<div class="tab_content m_b_30 marco">
			<?php 
				$first = true;
				if(!empty($about_us_multiples)):
					foreach($about_us_multiples AS $item): ?>
					<div class="cont_tab <?php echo ($first ? 'in active' : '' ); ?>" id="about_us<?php echo $item->id; ?>">
						<div class="large-6 medium-6 small-12 columns p_r_20 m_b_20">
							<div class="marco_nos">
								<?php if(!empty($item->image)): ?>
									<img src="<?php echo $item->image; ?>">
								<?php endif; ?>
							</div>
						</div>	
						<div class="large-6 medium-6 small-12 columns p_r_20 m_b_20">
							<h1 class="title"><?php echo $item->title; ?></h1>
							<p><?php echo $item->content; ?></p>
						</div>						
					</div>
					<?php $first = false;
					endforeach; 
				endif; ?>
		</section>
		<!-- Contenidos Tab -->

    </section>
</section>


