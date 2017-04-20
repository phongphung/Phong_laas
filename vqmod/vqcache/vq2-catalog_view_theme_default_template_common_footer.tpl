<footer>
  <div class="container">
    <div class="row">
      <?php if ($informations) { ?>
      <div class="col-sm-3">
        <h5><?php echo $text_information; ?></h5>
        <ul class="list-unstyled">
          <?php foreach ($informations as $information) { ?>
          <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
          <?php } ?>
        </ul>
      </div>
      <?php } ?>
      <div class="col-sm-3">
        <h5><?php echo $text_service; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
          <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
          <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <h5><?php echo $text_extra; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
          <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
          <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
          <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
        </ul>
      </div>
      <div class="col-sm-3">
        <h5><?php echo $text_account; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
          <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
          <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
          <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
        </ul>
      </div>
    </div>
    <hr>
    <p><?php echo $powered; ?></p> 
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

			 

			
</footer>

<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//--> 

<!-- Theme created by Welford Media for OpenCart 2.0 www.welfordmedia.co.uk -->


				<script src="catalog/view/javascript/jquery.elevatezoom.min.js" type="text/javascript"></script>
				<script type="text/javascript">
$(document).ready(function(){$("#zoom_01").elevateZoom({cursor:"crosshair",zoomWindowFadeIn:500,zoomWindowFadeOut:750,lensFadeIn:500,lensFadeOut:500})}),$(window).on("resize",function(){var o=$(this);$("#zoom_01").elevateZoom(o.width()<900?{cursor:"crosshair",zoomType:"inner",zoomWindowFadeIn:500,zoomWindowFadeOut:750,lensFadeIn:500,lensFadeOut:500}:{cursor:"crosshair",zoomType:"window",zoomWindowFadeIn:500,zoomWindowFadeOut:750,lensFadeIn:500,lensFadeOut:500})});
				</script>  
			
</body></html>