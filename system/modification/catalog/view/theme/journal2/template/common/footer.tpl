<?php
    if (!defined('JOURNAL_INSTALLED')) {
        echo '
            <h3>Journal Installation Error</h3>
            <p>Make sure you have uploaded all Journal files to your server and successfully replaced <b>system/engine/front.php</b> file.</p>
            <p>You can find more information <a href="http://docs.digital-atelier.com/opencart/journal/#/settings/install" target="_blank">here</a>.</p>
        ';
        exit();
    }
?>
</div>
<?php if ($this->journal2->settings->get('config_bottom_modules')):  ?>
<div id="bottom-modules">
   <?php echo $this->journal2->settings->get('config_bottom_modules'); ?>
</div>
<?php endif; ?>
<footer class="<?php echo $this->journal2->settings->get('fullwidth_footer'); ?>">
    <div id="footer">
        <?php echo $this->journal2->settings->get('config_footer_menu'); ?>
    </div>



			 

					<style type="text/css">

						.fixedHeader {

								background: none repeat scroll 0 0 #f5f5f5;

								padding: 15px 0 0 0;

								position: fixed;

								top: 0;

								width: 100%;

								z-index: 999;

								box-shadow: 0 1px 4px rgba(0, 0, 0, 0.3);

						}
                        
                        @media only screen and (max-width: 470px) {
                            .boxed-footer {
                                top: 135px;
                            }
                        }

					</style>

			 

					<script type="text/javascript">

						$(window).scroll(function(){

							//alert($(window).scrollTop());

							

							if($(window).scrollTop() > 140){

								$(".fixed-header").addClass("fixedHeader");

								$(".fixed-header .col-sm-4").addClass("col-xs-6");

								$(".fixed-header .col-sm-5").addClass("hidden-xs");

								$(".fixed-header .col-sm-3").addClass("col-xs-6");

							} else {

								$(".fixed-header").removeClass("fixedHeader");

							}

						});



					</script>

			 
<div class="scroll-top"></div>
<?php if ($this->journal2->settings->get('config_footer_modules')):  ?>
<?php echo $this->journal2->settings->get('config_footer_modules'); ?>
<?php endif; ?>
<?php $this->journal2->minifier->addScript('catalog/view/theme/journal2/js/init.js', 'footer'); ?>
<?php echo $this->journal2->minifier->js('footer'); ?>
<?php if ($this->journal2->cache->getDeveloperMode() || !$this->journal2->minifier->getMinifyJs()): ?>
<script type="text/javascript" src="index.php?route=journal2/assets/js&amp;j2v=<?php echo JOURNAL_VERSION; ?>"></script>
<?php endif; ?>
<?php $this->load->library('user'); $user = new User($this->registry); if ($user->isLogged()): ?>
<script src="catalog/view/theme/journal2/lib/ascii-table/ascii-table.min.js"></script>
<script>
    (function () {
        if (console && console.log) {
            var timers = $.parseJSON('<?php echo json_encode(Journal2::getTimer()); ?>');
            timers['Total'] = parseFloat('<?php echo Journal2::getElapsedTime(); ?>');
            var table = new AsciiTable('Journal2 Profiler');
            table.setAlignRight(1);
            $.each(timers, function (index, value) {
                if (value < 0) {
                    value = 0;
                }
                if (value < 100000) {
                    table.addRow(index.replace('ControllerModuleJournal2', ''), Math.round(value * 1000) + ' ms');
                }
            });
            console.log(table.toString());
        }
    }());
</script>
<?php endif; ?>

				<script src="catalog/view/javascript/jquery.elevatezoom.min.js" type="text/javascript"></script>
				<script type="text/javascript">
$(document).ready(function(){$("#zoom_01").elevateZoom({cursor:"crosshair",zoomWindowFadeIn:500,zoomWindowFadeOut:750,lensFadeIn:500,lensFadeOut:500})}),$(window).on("resize",function(){var o=$(this);$("#zoom_01").elevateZoom(o.width()<900?{cursor:"crosshair",zoomType:"inner",zoomWindowFadeIn:500,zoomWindowFadeOut:750,lensFadeIn:500,lensFadeOut:500}:{cursor:"crosshair",zoomType:"window",zoomWindowFadeIn:500,zoomWindowFadeOut:750,lensFadeIn:500,lensFadeOut:500})});
				</script>  
			
</body>
</html>
