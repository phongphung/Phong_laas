<?php if(!$shipping_required){ ?>
<div class="supercheckout-checkout-content" style="display:block">
    <div class="permanent-warning" style="display: block;">No shipping required with these product(s).<img src="catalog/view/theme/<?php echo $default_theme; ?>/image/close.png" alt="" class="close" /></div>
</div>
<?php } ?>
<?php if ($error_warning) { ?>
    <div class="supercheckout-checkout-content" style="display:block;">
        <div class="warning"><?php echo $error_warning; ?></div>
    </div>
<?php } ?>
<?php if ($shipping_methods && $shipping_required) { ?>
<table class="radio">
    <?php foreach ($shipping_methods as $shipping_method) { ?>
    <?php if (!$shipping_method['error']) { ?>
    <?php foreach ($shipping_method['quote'] as $quote) { ?>
    <?php if($settings['step']['shipping_method']['display_title']){ ?>
    <tr>
        <td colspan="3"><b><?php echo $shipping_method['title']; ?></b></td>
    </tr>
    <?php } ?>
    <tr class="highlight">
        <td><?php if ($quote['code'] == $code || !$code) { ?>
            <?php $code = $quote['code']; ?>
            <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" id="<?php echo $quote['code']; ?>" checked="checked" />
            <?php } else { ?>
            <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" id="<?php echo $quote['code']; ?>" />
            <?php } ?></td>
        <td><label for="<?php echo $quote['code']; ?>"><?php echo $quote['title']; ?></label></td>
        <td style="text-align: right;" class="price"><label for="<?php echo $quote['code']; ?>"><?php echo $quote['text']; ?></label></td>
    </tr>
    <?php } ?>
    <?php } else { ?>
    <tr>
        <td colspan="3"><div class="error"><?php echo $shipping_method['error']; ?></div></td>
    </tr>
    <?php } ?>
    <?php } ?>
</table>
<br />
<?php } ?>

