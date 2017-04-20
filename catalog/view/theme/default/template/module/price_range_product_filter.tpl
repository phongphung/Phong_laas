<div class="well">

	<h3><?php echo $heading_title; ?></h3>

	<div class="list-group">

	<?php $cnt = 0; foreach($url_data as $data_url) { $cnt++;?>

		<span class="list-group-item">

			<input onclick="price_filter();" type="checkbox" name="filter_price[]" value="<?php echo $cnt;?>" <?php echo in_array($cnt, $price_array_cnt) ? 'checked' : '' ;?> />  &nbsp; 

 			<?php echo $data_url['min'];?>

			-

			<?php echo $data_url['max'];?> 		

		</span>

 	<?php } ?>

	</div>		

	<div>

		<input type="text" name="filter_min_price" id="filter_min_price" class="form-control" value="<?php echo $filter_min_price;?>" style="width:100px;display:inline-block" /> -

		<input type="text" name="filter_max_price" id="filter_max_price" class="form-control" value="<?php echo $filter_max_price;?>" style="width:100px;display:inline-block" />

		<p><a id="button-filter_price_range" class="btn btn-primary btn-seach" ><span class="hidden-xs hidden-sm hidden-md"> Tìm</span> </a> &nbsp;

		<a id="button-filter_price_range_clear" class="btn btn-danger btn-remove" ><span class="hidden-xs hidden-sm hidden-md"> Xóa</span> </a>

		</p>

  	</div>	

<script language="javascript">

function price_filter() 

{ 

	var url = '<?php echo $base_href; ?>';

	var price_array = <?php echo json_encode($price_array ); ?>;

	var url = url.replace('amp;','');

	var checkboxValues = [];

	

	$('input[name="filter_price[]"]:checked').each(function() {

	   checkboxValues.push($(this).val());

	});

	//alert(checkboxValues[checkboxValues.length-1]);

	price_id =  checkboxValues.join("_");

	

	var filter_price = price_id;



	if (filter_price) {

		url += '&filter_price=' + encodeURIComponent(filter_price);

	}



	if (checkboxValues.length === 0) {

		var filter_min_price = $('input[name=\'filter_min_price\']').val();

		var filter_max_price = $('input[name=\'filter_max_price\']').val();

	} else {

		var filter_min_price = price_array[checkboxValues[0]-1]['min_price'];

		var filter_max_price = price_array[checkboxValues[checkboxValues.length-1]-1]['max_price'];

	}



	if (filter_min_price) {

		url += '&filter_min_price=' + encodeURIComponent(filter_min_price);

	}

  

	if (filter_max_price) {

		url += '&filter_max_price=' + encodeURIComponent(filter_max_price);

	} 

 	 

	location = url;

}

$('#button-filter_price_range').on('click', function() {

	var url = '<?php echo $base_href; ?>';

	var price_array = <?php echo json_encode($price_array ); ?>;

	var url = url.replace('amp;','');

	var checkboxValues = [];

	

	$('input[name="filter_price[]"]:checked').each(function() {

	   checkboxValues.push($(this).val());

	});

	//alert(checkboxValues[checkboxValues.length-1]);

	price_id =  checkboxValues.join("_");

	

	var filter_price = price_id;



	if (filter_price) {

		url += '&filter_price=' + encodeURIComponent(filter_price);

	}



	if (checkboxValues.length === 0) {

		var filter_min_price = $('input[name=\'filter_min_price\']').val();

		var filter_max_price = $('input[name=\'filter_max_price\']').val();

	} else {

		var filter_min_price = price_array[checkboxValues[0]-1]['min_price'];

		var filter_max_price = price_array[checkboxValues[checkboxValues.length-1]-1]['max_price'];

	}



	if (filter_min_price) {

		url += '&filter_min_price=' + encodeURIComponent(filter_min_price);

	}

  

	if (filter_max_price) {

		url += '&filter_max_price=' + encodeURIComponent(filter_max_price);

	} 

 	 

	location = url;

});

$('#button-filter_price_range_clear').on('click', function() {

	var url = '<?php echo $base_href; ?>';

	var url = url.replace('amp;','');

  	 

	location = url;

});

</script>

</div>