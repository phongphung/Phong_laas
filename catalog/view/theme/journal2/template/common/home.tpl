<?php echo $header; ?>
<div class="full-width-banner">
  <?php echo $content_top; ?>  
</div>

<div id="container" class="container j-container">
  <div class="row"><?php echo $column_left; ?><?php echo $column_right; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="fix-overlap-on-mobile <?php echo $class; ?>"><?php echo $content_bottom; ?></div>
    </div>
</div>
<style>
.boxed-header header{
	border-bottom:1px black solid;

	margin-bottom:10px;
	box-shadow: 0 6px 4px -4px black;
	max-width:100%;
}
</style>
<?php echo $footer; ?>