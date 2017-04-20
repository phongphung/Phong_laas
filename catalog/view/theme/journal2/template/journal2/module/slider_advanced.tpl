<div style="<?php echo $width; ?>; height: 500px;" class="tp-banner-container box <?php echo $js_options['hideThumbs'] ? 'nav-on-hover' : '' ?> <?php echo $slider_class; ?> <?php echo $js_options['thumbAmount'] === '' ? 'full-thumbs' : ''; ?> <?php echo $hide_on_mobile_class; ?> <?php echo Journal2Utils::getProperty($js_options, 'navigationType') === 'none' ? 'hide-navigation' : ''; ?>">
    <div class="tp-banner" id="journal-slider-<?php echo $module; ?>" style="max-height: <?php echo $height; ?>px;">
        <ul class="slideshow">
            <?php foreach ($slides as $slide): ?>
            <li <?php echo $slide['data']; ?> class="slide-image" >
              <?php if ($preload_images): ?>
                <a href="<?php if (isset($slide['link']) && $slide['link']): echo $slide['link']; else: echo "#"; endif; ?>">
                  <img src="<?php echo $dummy_image; ?>" data-lazyload="<?php echo $slide['image']; ?>" alt="<?php echo $slide['name']; ?>"  style="width: 100%;"/>
                </a>
              <?php else: ?>
                <a href="<?php if (isset($slide['link']) && $slide['link']): echo $slide['link']; else: echo "#"; endif; ?>">
                  <img src="<?php echo $slide['image']; ?>" alt="<?php echo $slide['name']; ?>" style="width: 100%;"/>
                </a>
              <?php endif; ?>
              
              <?php foreach ($slide['captions'] as $caption): ?>
                <?php if ($caption['link']): ?>
                  <a id="jcaption-<?php echo $caption['id']; ?>" href="<?php echo $caption['link']; ?>" <?php echo $caption['target']; ?> class="tp-caption <?php echo $caption['classes']; ?>" style="<?php echo $caption['css']; ?>" <?php echo $caption['data']; ?>>
                  <?php echo $caption['content']; ?>
                  </a>
                <?php else: ?>
                  <div id="jcaption-<?php echo $caption['id']; ?>" class="tp-caption <?php echo $caption['classes']; ?>" style="<?php echo $caption['css']; ?>" <?php echo $caption['data']; ?>>
                  <?php echo $caption['content']; ?>
                  </div>
                <?php endif; ?>
              <?php endforeach; ?>
            </li>
            <?php endforeach; ?>
        </ul>
        <!--<?php if ($timer === 'top'): ?>
        <div class="tp-bannertimer"></div>
        <?php elseif ($timer === 'bottom'): ?>
        <div class="tp-bannertimer tp-bottom"></div>
        <?php endif; ?>-->
        <?php if (count($slides) > 1): ?>
        <div style="position: absolute; top: 300px; margin-top: -23px; left: 20px;" class="tp-leftarrow  tparrows default round">
          <div class="tp-arr-allwrapper">
            <div class="tp-arr-iwrapper">
              <div class="tp-arr-imgholder"></div>
              <div class="tp-arr-imgholder2"></div>
              <div class="tp-arr-titleholder"></div>
              <div class="tp-arr-subtitleholder">
              </div>
            </div>
          </div>
        </div>
        
        <div style="position: absolute; top: 300px; margin-top: -23px; right: 20px;" class="tp-rightarrow  tparrows default round">
          <div class="tp-arr-allwrapper">
            <div class="tp-arr-iwrapper">
              <div class="tp-arr-imgholder"></div>
              <div class="tp-arr-imgholder2"></div>
              <div class="tp-arr-titleholder"></div>
              <div class="tp-arr-subtitleholder"></div>
            </div>
          </div>
        </div>
        <?php endif; ?>
    </div>
</div>

<script>
    (function () {
        $('<style><?php echo implode(" ", $global_style); ?></style>').appendTo($('head'));

        $(function() {
        
        
          var transition = function(images, hideImgPos, showImgPos) {
            $(images[hideImgPos]).fadeOut(500);
            $(imgs[showImgPos]).show(500);
          };
          var current_img = 0;
          var imgs = $('.slideshow .slide-image');
          $(imgs).each(function(){
            $(this).find('a').attr('href', $(this).attr('data-link'));
          });
          $(imgs).hide();
          var runSlide = null;
          
          var slide = function(bln) {
            if (bln == 1 && runSlide != null) {
              clearInterval(runSlide);
            }
            
            runSlide = setInterval(function () {
              transition(imgs, bln == 1 ? current_img : current_img - 1 < 0 ? imgs.length - 1 : current_img - 1, bln != 1 ? current_img : current_img == imgs.length - 1 ? 0 : current_img + 1);
              current_img = current_img == imgs.length - 1 ? 0 : current_img + 1;
            }, 3000);
          };
          
          $(imgs[current_img++]).show();
          if (imgs.length > 1) {
            slide(0);
          }
          
          $('.tp-leftarrow').click(function() {
            transition(imgs, current_img, current_img == 0 ? imgs.length - 1 : current_img - 1);
            current_img = current_img == imgs.length - 1 ? 0 : current_img + 1;
            slide(1);
          });
          
          $('.tp-rightarrow').click(function() {
            debugger;
            transition(imgs, current_img, current_img == imgs.length - 1 ? 0 : current_img + 1);
            current_img = current_img == imgs.length - 1 ? 0 : current_img + 1;
            slide(1);
          });
          /*  var opts = $.parseJSON('<?php echo json_encode($js_options); ?>');
            opts.hideThumbs = 0;
            $('#journal-slider-<?php echo $module; ?>').show().revolution(opts);
            <?php if ($timer !== 'top' && $timer !== 'bottom'): ?>
            $('#journal-slider-<?php echo $module; ?> .tp-bannertimer').hide();
            <?php endif; ?>
          */  
        });
    })();
</script>
