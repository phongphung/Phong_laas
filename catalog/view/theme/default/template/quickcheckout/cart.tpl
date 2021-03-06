<style>
	.button-update{
		display:none;
	}
	.spec_text{
		display: inline-block;

    		padding-right: 10px;
   		padding-top: 7px;
    		font-size: 17px;
		
	}
</style>
<table class="quickcheckout-cart">
	<thead>
		<tr>
		  <td class="image"><?php echo $text_image; ?></td>
		  <td class="name"><?php echo $text_name; ?></td>
		  <td class="quantity"><?php echo $text_quantity; ?></td>
		  <td class="price"><?php echo $text_price; ?></td>
		  <td class="total"><?php echo $text_total; ?></td>
		</tr>
	</thead>
    <?php if ($products || $vouchers) { ?>
	<tbody>
        <?php foreach ($products as $product) { ?>
        <tr>
      <td class="image"><?php if ($product['thumb']) { ?>
            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
            <?php } ?></td>
          <td class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
            <div>
              <?php foreach ($product['option'] as $option) { ?>
              <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small><br />
              <?php } ?>
			  <?php if ($product['reward']) { ?>
			  <br />
			  <small><?php echo $product['reward']; ?></small>
			  <?php } ?>
			  <?php if ($product['recurring']) { ?>
			  <br />
			  <span class="label label-info"><?php echo $text_recurring_item; ?></span> <small><?php echo $product['recurring']; ?></small>
			  <?php } ?>
            </div></td>
          <td class="quantity"><?php if ($edit_cart) { ?>
		    <div class="input-group btn-block">
		     <!----- wait for fix  <input type="text" name="quantity[<?php echo $product['key']; ?>]" size="2" value="<?php echo $product['quantity']; ?>" class="form-control" />   --->
			<span type="text" class="spec_text"> <?php echo $product['quantity']; ?>  </span>
			  <span class="input-group-btn">
				<button data-toggle="tooltip" title="<?php echo $button_update; ?>" class="btn btn-primary button-update"><i class="fa fa-refresh"></i></button>
				<button data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger button-remove" data-remove="<?php echo $product['key']; ?>"><i class="fa fa-times-circle"></i></button>
			  </span>
			</div>
			<?php } else { ?>
			x&nbsp;<?php echo $product['quantity']; ?>
			<?php } ?></td>
		  <td class="price"><?php echo $product['price']; ?></td>
          <td class="total"><?php echo $product['total']; ?></td>
        </tr>
        <?php } ?>
        <?php foreach ($vouchers as $voucher) { ?>
        <tr>
          <td class="image"></td>
          <td class="name"><?php echo $voucher['description']; ?></td>
          <td class="quantity">x&nbsp;1</td>
		  <td class="price"><?php echo $voucher['amount']; ?></td>
          <td class="total"><?php echo $voucher['amount']; ?></td>
        </tr>
        <?php } ?>
		<?php foreach ($totals as $total) { ?>
			<tr>
				<td style="text-align:right;" colspan="3"><b><?php echo $total['title']; ?>:</b></td>
				<td style="text-align:right;"><?php echo $total['text']; ?></td>
			</tr>
        <?php } ?>
	</tbody>
    <?php } ?>
</table>