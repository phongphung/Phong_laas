<label style="display:none;"><?php if ($text_agree) { ?>
  <?php echo $text_agree; ?>
  <?php if ($agree) { ?>
  <input type="checkbox" name="agree" value="1" checked="checked" />
  <?php } else { ?>
  <input type="checkbox" name="agree" value="1" checked="checked"/>
  <?php } ?>
<?php } ?></label>
<button type="button" id="button-payment-method" class="btn btn-primary"><?php echo $button_continue; ?> Thanh Toán</button>