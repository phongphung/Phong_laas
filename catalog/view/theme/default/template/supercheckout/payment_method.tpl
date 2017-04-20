<?php if ($error_warning) { ?>
<div class="supercheckout-checkout-content" style="display:block;">
    <div class="warning"><?php echo $error_warning; ?></div>
</div>
<?php } ?>
<?php if ($payment_methods) { ?>                 
<table class="radio">
    <?php foreach ($payment_methods as $payment_method) { ?>
    <tr class="highlight">
        <td><?php if ($payment_method['code'] == $code || !$code) { ?>
            <?php $code = $payment_method['code']; ?>
            <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" id="<?php echo $payment_method['code']; ?>" checked="checked" />
            <?php } else { ?>
            <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" id="<?php echo $payment_method['code']; ?>"   />
            <?php } ?></td>
        <td><label for="<?php echo $payment_method['code']; ?>"><?php echo $payment_method['title']; ?></label></td>
    </tr>
    <?php } ?>
</table>
<br />
<?php } ?>