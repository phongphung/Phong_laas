<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
    
    <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-free" data-toggle="tooltip" title="" class="btn btn-primary" data-original-title="Save"><i class="fa fa-save"></i></button>
        <a onclick="location = '<?php echo $cancel; ?>';" data-toggle="tooltip" title="" class="btn btn-default" data-original-title="Cancel"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
      <?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
    </div>
  </div>

<div class="container-fluid">
<div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i><?php echo $heading_title; ?></h3>
      </div>
  <div class="panel-body">
      
        <!--<div id="tabs" class="vtabs"><a href="#tab-general"><?php echo $tab_general; ?></a>
          <?php foreach ($geo_zones as $geo_zone) { ?>
          <a href="#tab-geo-zone<?php echo $geo_zone['geo_zone_id']; ?>"><?php echo $geo_zone['name']; ?></a>
          <?php } ?>
        </div>-->
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-free">
        
            <div class="form-group">
            <label class="col-sm-2 control-label" for="input-total"><span data-toggle="tooltip" title="" data-original-title="Sub-Total amount needed before the free shipping module becomes available."><?php echo $entry_tax; ?></span></label>
            <div class="col-sm-10">
             
                <select name="standard_cost_tax_class_id" class="form-control">
                  <option value="0"><?php echo $text_none; ?></option>
                  <?php foreach ($tax_classes as $tax_class) { ?>
                  <?php if ($tax_class['tax_class_id'] == $standard_cost_tax_class_id) { ?>
                  <option value="<?php echo $tax_class['tax_class_id']; ?>" selected="selected"><?php echo $tax_class['title']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select>
            </div>
          </div>
              
            <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="standard_cost_status" id="input-status" class="form-control">
                               <?php if ($standard_cost_status) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                              </select>
            </div>
              
          </div>
        <br>
            <div class="form-group">
            <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
            <div class="col-sm-10">
                <input type="text" name="standard_cost_sort_order" value="<?php echo $standard_cost_sort_order; ?>" size="1" class="form-control" />
            </div>
          </div>
          
        <br>
        <?php foreach ($geo_zones as $geo_zone) { ?>
        <div id="tab-geo-zone<?php echo $geo_zone['geo_zone_id']; ?>" class="vtabs-content">
          <table class="form">
            <tr>
              <td><?php echo $entry_rate; ?></td>
              <td><textarea name="standard_cost_<?php echo $geo_zone['geo_zone_id']; ?>_rate" cols="40" rows="5"><?php echo ${'standard_cost_' . $geo_zone['geo_zone_id'] . '_rate'}; ?></textarea></td>
            </tr>
            <tr>
              <td><?php echo $entry_status; ?></td>
              <td><select name="standard_cost_<?php echo $geo_zone['geo_zone_id']; ?>_status">
                  <?php if (${'standard_cost_' . $geo_zone['geo_zone_id'] . '_status'}) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select></td>
            </tr>
          </table>
        </div>
        <?php } ?>
    </form>
      </div>
  </div>
</div>
</div>
<script type="text/javascript"><!--
$('.vtabs a').tabs();
//--></script>
<?php echo $footer; ?>