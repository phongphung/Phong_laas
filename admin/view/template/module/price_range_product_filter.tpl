<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-price_range_product_filter" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
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
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-price_range_product_filter" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="name" value="<?php echo $name; ?>" placeholder="<?php echo $entry_name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div>          
           
           <div class="form-group">
            <label class="col-sm-2 control-label" for="input-min_price"><?php echo $entry_min_price; ?></label>
            <div class="col-sm-10">
              <input type="text" name="min_price" value="<?php echo $min_price; ?>" placeholder="<?php echo $entry_min_price; ?>" id="input-min_price" class="form-control" />
              <?php if ($error_min_price) { ?>
              <div class="text-danger"><?php echo $error_min_price; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-max_price"><?php echo $entry_max_price; ?></label>
            <div class="col-sm-10">
              <input type="text" name="max_price" value="<?php echo $max_price; ?>" placeholder="<?php echo $entry_max_price; ?>" id="input-max_price" class="form-control" />
              <?php if ($error_max_price) { ?>
              <div class="text-danger"><?php echo $error_max_price; ?></div>
              <?php } ?>
            </div>
          </div>
		  
		  <div class="form-group">
            <label class="col-sm-2 control-label" for="input-price_gap"><?php echo $entry_price_gap; ?></label>
            <div class="col-sm-10">
              <input type="text" name="price_gap" value="<?php echo $price_gap; ?>" placeholder="<?php echo $entry_price_gap; ?>" id="input-price_gap" class="form-control" />
              <?php if ($error_price_gap) { ?>
              <div class="text-danger"><?php echo $error_price_gap; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="status" id="input-status" class="form-control">
                <?php if ($status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
  </div>
<?php echo $footer; ?>