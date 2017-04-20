<?php echo $header; ?><?php echo $column_left; ?>

<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-body">
		<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">
		
			<fieldset>
				<div class="form-group">
					<label class="col-sm-2 control-label"><?php echo $entry_enable; ?></label>
					<div class="col-sm-10">
					  <label class="radio-inline">
						<input type="radio" name="poi_module_enable" value="1" <?php echo $enable ? 'checked="checked"' : ''; ?> ><?php echo $text_yes;?>
					  </label>
					  <label class="radio-inline">
						<input type="radio" name="poi_module_enable" value="0" <?php echo !$enable ? 'checked="checked"' : ''; ?> ><?php echo $text_no;?>
					  </label>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label"><?php echo $entry_show_selected_image_in_cart; ?></label>
					<div class="col-sm-10">
					  <label class="radio-inline">
						<input type="radio" name="poi_module_show_selected_image_in_cart" value="1" <?php echo $show_image_enable ? 'checked="checked"' : ''; ?> ><?php echo $text_yes;?>
					  </label>
					  <label class="radio-inline">
						<input type="radio" name="poi_module_show_selected_image_in_cart" value="0" <?php echo !$show_image_enable ? 'checked="checked"' : ''; ?> ><?php echo $text_no;?>
					  </label>
					</div>
				</div>
			</fieldset>
		</form>
		<p>
			Thank you for your purchase, please check <a href="http://www.opencart.com/index.php?route=extension/extension&filter_username=WeDoWeb" title="WeDoWeb's OpenCart extensions">our website</a> for more useful extensions.<br/>
			<br/>
			<b><a href="http://wedoweb.com.au" title="WeDoWeb Team">WeDoWeb Team</a></b>
		</p>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
	/*function show_select_onchange() {
		var poi_enable = document.getElementById("poi_module_enable");
		var option_enable = poi_enable.options[poi_enable.selectedIndex].value;
		if(option_enable == 1) {
			document.getElementById("show_selected_image_in_cart").style.visibility = 'visible';
		}
		else {
			document.getElementById("show_selected_image_in_cart").style.visibility = 'hidden';
		}
	}*/
</script>

<?php echo $footer; ?>