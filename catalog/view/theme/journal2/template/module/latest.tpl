<div class="box oc-module">
<h3 class="box-heading"><?php echo $heading_title; ?></h3>
<div class="box-content row">
  <div class="box-product">
  <?php foreach ($products as $product) { ?>
  <div class="product-grid-item <?php echo $this->journal2->settings->get('product_grid_classes'); ?> display-<?php echo $this->journal2->settings->get('product_grid_wishlist_icon_display'); ?> <?php echo $this->journal2->settings->get('product_grid_button_block_button'); ?>">
      <div class="product-thumb product-wrapper">
        <div class="image">
          <a href="<?php echo $product['href']; ?>" <?php if(isset($product['thumb2']) && $product['thumb2']): ?> class="has-second-image" style="background: url('<?php echo $product['thumb2']; ?>') no-repeat;" <?php endif; ?>>
              <img class="lazy first-image" src="<?php echo $this->journal2->settings->get('product_dummy_image'); ?>" data-src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
          </a>
          <?php if (isset($product['labels']) && is_array($product['labels'])): ?>
          <?php foreach ($product['labels'] as $label => $name): ?>
          <?php if ($label === 'outofstock'): ?>
          <img class="outofstock" <?php echo Journal2Utils::getRibbonSize($this->journal2->settings->get('out_of_stock_ribbon_size')); ?> style="position: absolute; top: 0; left: 0" src="<?php echo Journal2Utils::generateRibbon($name, $this->journal2->settings->get('out_of_stock_ribbon_size'), $this->journal2->settings->get('out_of_stock_font_color'), $this->journal2->settings->get('out_of_stock_bg')); ?>" alt="" />
          <?php else: ?>
          <span class="label-<?php echo $label; ?>"><b><?php echo $name; ?></b></span>
          <?php endif; ?>
          <?php endforeach; ?>
          <?php endif; ?>
          <?php if($this->journal2->settings->get('product_grid_wishlist_icon_position') === 'image' && $this->journal2->settings->get('product_grid_wishlist_icon_display', '') === 'icon'): ?>
          <?php endif; ?>
        </div>
        <div class="product-details">
          <div class="caption">
            <h4 class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
            <p class="description"><?php echo $product['description']; ?></p>
            <?php if ($product['rating']) { ?>
            <div class="rating">
              <?php for ($i = 1; $i <= 5; $i++) { ?>
              <?php if ($product['rating'] < $i) { ?>
              <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
              <?php } else { ?>
              <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
              <?php } ?>
              <?php } ?>
            </div>
            <?php } ?>
            <?php if ($product['price']) { ?>
            <p class="price">
              <?php if (!$product['special']) { ?>
              <?php echo $product['price']; ?>
              <?php } else { ?>
              <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new" <?php echo isset($product['date_end']) && $product['date_end'] ? "data-end-date='{$product['date_end']}'" : ""; ?>><?php echo $product['special']; ?></span>
              <?php } ?>
              <?php if ($product['tax']) { ?>
              <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
              <?php } ?>
            </p>
            <?php } ?>
          </div>
          <div class="button-group">
            <?php if (Journal2Utils::isEnquiryProduct($this, $product['product_id'])): ?>
            <div class="cart enquiry-button">
              <a href="<?php echo $this->journal2->settings->get('enquiry_popup_code'); ?>" data-clk="addToCart('<?php echo $product['product_id']; ?>');" class="button hint--top" data-hint="<?php echo $this->journal2->settings->get('enquiry_button_text'); ?>"><?php echo $this->journal2->settings->get('enquiry_button_icon') . '<span class="button-cart-text">' . $this->journal2->settings->get('enquiry_button_text') . '</span>'; ?></a>
            </div>
            <?php else: ?>
            <div class="cart <?php echo isset($product['labels']) && is_array($product['labels']) && isset($product['labels']['outofstock']) ? 'outofstock' : ''; ?>">
              <a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button hint--top" data-hint="<?php echo $button_cart; ?>"><i class="button-left-icon"></i><span class="button-cart-text"><?php echo $button_cart; ?></span><i class="button-right-icon"></i></a>
            </div>
            <?php endif; ?>
          </div>
        </div>
      </div>
  </div>
  <?php } ?>
  </div>
</div>
</div>