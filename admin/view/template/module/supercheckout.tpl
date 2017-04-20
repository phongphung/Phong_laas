<?php echo $header; ?>
<!-- Main Container Fluid -->
<div class="container-960 fluid <?php if($rightMenu){ echo 'menu-right'; }else{ echo 'menu-left'; } ?> ">
    <!-- Top navbar -->
    <div class="navbar main hidden-print">
        <!-- Brand & save buttons -->
        <ul class="pull-left">
            <li class="hidden-sm"><a href="" class="appbrand"><span>Super Checkout <span>v1.6</span></span></a></li>
        </ul>
        <?php
        if(!isset($_GET['store_id'])) {
            $_GET['store_id'] = 0;
        }
        ?>
        <div class="topbuttons"><?php if(isset($stores)) { ?>
            <select class="selectpicker col-md-4" onChange="location='<?php echo $route; ?>&store_id='+$(this).val()">
                <?php  foreach($stores as $store) { ?>
                <?php if($store['store_id'] == $_GET['store_id'] && $_GET['store_id'] != 0) { ?>
                <option value="<?php echo $store['store_id']; ?>" selected="selected"><?php echo $store['name']; ?></option>
                <?php }else{ ?>
                <option value="<?php echo $store['store_id']; ?>" ><?php echo $store['name']; ?></option>
                <?php } ?>
                <?php } ?>
            </select>
            <?php }?> <a onClick="save()" class="btn btn-default"><span><?php echo $button_save_and_stay; ?></span></a>&nbsp;&nbsp;&nbsp;<a onClick="$('#form').submit();" class="btn btn-default"><span><?php echo $button_save; ?></span></a>&nbsp;&nbsp;&nbsp;<a onClick="location = '<?php echo $cancel; ?>';" class="btn btn-default"><span><?php echo $button_cancel; ?></span></a>
            <span class="gritter-add-primary btn btn-default btn-block hidden">For notifications on saving</span>
                
        </div>
    </div>
    <!-- Top navbar END -->
        
    <!-- Sidebar menu & content wrapper -->
    <div id="wrapper">
        <!-- Sidebar Menu -->
        <div id="menuVel" class="hidden-sm hidden-print">
            <!-- Scrollable menu wrapper with Maximum height -->
            <div class="slim-scroll" data-scroll-height="800px">
                <!-- Regular Size Menu -->
                <ul id="supercheckout-tabs">
                    <!-- Menu Regular Item -->
                    <li class="glyphicons settings  active"><a href="#tab_general_settings" data-toggle="tab"><i></i><span><?php echo $supercheckout_text_general; ?></span></a></li>
                    <li class="glyphicons keys" ><a href="#tab_login" data-toggle="tab"><i></i><span><?php echo $supercheckout_text_login; ?></span></a></li>
                    <li class="glyphicons home" ><a href="#tab_payment_address" data-toggle="tab"><i></i><span><?php echo $supercheckout_text_payment_address; ?></span></a></li>
                    <li class="glyphicons home"><a href="#tab_shipping_address" data-toggle="tab"><i></i><span><?php echo $supercheckout_text_shipping_address; ?></span></a></li>
                    <li class="glyphicons cargo"><a href="#tab_shipping" data-toggle="tab"><i></i><span><?php echo $supercheckout_text_shipping_method; ?></span></a></li>
                    <li class="glyphicons credit_card"><a href="#tab_payment" data-toggle="tab"><i></i><span><?php echo $supercheckout_text_payment_method; ?></span></a></li>
                    <li class="glyphicons ok_2"><a href="#tab_confirm" data-toggle="tab"><i></i><span><?php echo $supercheckout_text_confirm; ?></span></a></li>
                    <li id="design_tab" class="glyphicons fabric "><a id="design_tab_anchor" href="#tab_design_checkout" data-toggle="tab"><i></i><span><?php echo $supercheckout_text_design; ?></span></a></li>                            
                    <li class="glyphicons eyedropper"><a data-target="#themer" data-toggle="collapse"><i></i><span>Themer</span></a></li>
                    <!-- // Menu Regular Items END -->
                </ul>
                <div class="clearfix"></div>
                <div class="separator bottom"></div>
                <!-- // Regular Size Menu END -->
                    
                <!-- Menu Position Change -->
                <div class="separator top uniformjs menu_js hidden-sm">
                    <div class="innerLR">
                        <label for="toggle-menu-position" class="checkbox">
                            <input type="checkbox" class="checkbox" id="toggle-menu-position" /> 
                            right menu
                        </label>
                    </div>
                </div>
                <!-- // Menu Position Change END -->                      
            </div>
            <!-- // Scrollable Menu wrapper with Maximum Height END -->
        </div>
        <!-- // Sidebar Menu END -->
            
        <!-- Content -->
        <div id="content">
            <div class="breadcrumb">
                <div class="layout">
                    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
                    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
                    <?php } ?>
                </div>
            </div>
            <?php if ($error_warning) { ?>
            <div class="alert alert-error" style="display:block;">
                <button class="close" data-dismiss="alert" type="button">Ãƒâ€”</button>
                <strong>Warning!</strong>
                <?php echo $error_warning; ?>
            </div>
            <?php } ?>
            
            <div class="successSave"></div>
            <div class="box"> 
                <!-- 960px -->
                <div class="content tabs" style="padding:0 50px;">
                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
                        
                        
						<?php if(isset($supercheckout['step']['html'])){ ?>
                            <?php foreach($supercheckout['step']['html']as $a=>$b){  ?>
                                <?php if(isset($b['value'])){  ?>
                                    <input type="hidden" id="modals-bootbox-prompt_h_<?php echo $a; ?>" name="supercheckout[step][html][<?php echo $a; ?>][value]" value="<?php echo $b['value']; ?>">
                                <?php } ?>
                            <?php } ?>
                        <?php } ?>
                        <?php if(isset($supercheckout['step']['html_value']['value'])){ ?>
                            <?php foreach($supercheckout['step']['html_value']['value'] as $k=>$v){  ?>
                                <input type="hidden" id="modals-bootbox-prompt_h_<?php echo $k; ?>" name="supercheckout[step][html_value][value][<?php echo $k; ?>]" value="<?php echo $v; ?>">
                            <?php } ?>
                        <?php } ?>
                        <div class="layout">                                    
                            <div class="tab-content even-height">
                                
                                <!---------------------------------- General ---------------------------------->
                                <div id="tab_general_settings" class="tab-pane active">
                                    <h3 class="heading-mosaic"><?php echo $supercheckout_text_general; ?></h3>
                                    <div class="block">
                                        <table class="form">
                                            <tr>
                                                <td class="name"><span class="control-label"><?php echo $supercheckout_text_general_enable; ?></span>                                                                
                                                    <i class="icon-question-sign" data-toggle="tooltip"  data-placement="top" data-original-title="<?php echo $general_enable_supercheckout_tooltip; ?>"></i>
                                                </td>
                                                <td class="settings "><input type="hidden" value="0" name="supercheckout[general][enable]" />
                                                    <?php if(isset($supercheckout['general']['enable']) && $supercheckout['general']['enable'] == 1){ ?>
                                                    <div <?php if($IE7==true){ echo""; }else{ echo'class="make-switch" data-on="primary" data-off="default"'; } ?> >
                                                        <input <?php if($IE7==true){ echo'class="checkbox"'; }else{ echo'class="make-switch"'; } ?> type="checkbox" value="1" name="supercheckout[general][enable]" id="checkout_enable" checked="checked" />
                                                    </div>
                                                    <?php } else { ?>
                                                    <div <?php if($IE7==true){ echo""; }else{ echo'class="make-switch" data-on="primary" data-off="default"'; } ?> >
                                                        <input <?php if($IE7==true){ echo'class="checkbox"'; }else{ echo'class="make-switch"'; } ?> type="checkbox" value="1" name="supercheckout[general][enable]" id="checkout_enable" />
                                                    </div>
                                                    <?php } ?>                    
                                                </td>
                                            </tr>     
                                            <tr>
                                                <td class="name">
                                                    <span class="control-label"><?php echo $supercheckout_text_general_guestenable; ?></span>
                                                    <i class="icon-question-sign" data-toggle="tooltip"  data-placement="top" data-original-title="<?php echo $general_guestenable_supercheckout_tooltip; ?>"></i>
                                                </td>
                                                <td class="settings ">
                                                    <input type="hidden" value="0" name="supercheckout[general][guestenable]" />
                                                    <?php if(isset($supercheckout['general']['guestenable']) && $supercheckout['general']['guestenable'] == 1){ ?>
                                                    <div <?php if($IE7==true){ echo""; }else{ echo'class="make-switch" data-on="primary" data-off="default"'; } ?>>
                                                        <input <?php if($IE7==true){ echo'class="checkbox"'; }else{ echo'class="make-switch"'; } ?>  type="checkbox" value="1" name="supercheckout[general][guestenable]" id="checkout_enable" checked="checked" />
                                                    </div>
                                                    <?php } else { ?>
                                                    <div <?php if($IE7==true){ echo""; }else{ echo'class="make-switch" data-on="primary" data-off="default"'; } ?>>
                                                        <input <?php if($IE7==true){ echo'class="checkbox"'; }else{ echo'class="make-switch"'; } ?>  type="checkbox" value="1" name="supercheckout[general][guestenable]" id="checkout_enable" />
                                                    </div>
                                                    <?php } ?>                    
                                                </td>                                                            
                                            </tr> 
                                            <tr>
                                                <td class="name">
                                                    <span class="control-label"><?php echo $supercheckout_text_general_guest_manual; ?></span>
                                                    <i class="icon-question-sign" data-toggle="tooltip"  data-placement="top" data-original-title="<?php echo $general_guest_manual_supercheckout_tooltip; ?>"></i>
                                                </td>
                                                <td class="settings ">
                                                    <input type="hidden" value="0" name="supercheckout[general][guest_manual]" />
                                                    <?php if(isset($supercheckout['general']['guest_manual']) && $supercheckout['general']['guest_manual'] == 1){ ?>
                                                    <div <?php if($IE7==true){ echo""; }else{ echo'class="make-switch" data-on="primary" data-off="default"'; } ?>>
                                                        <input <?php if($IE7==true){ echo'class="checkbox"'; }else{ echo'class="make-switch"'; } ?>  type="checkbox" value="1" name="supercheckout[general][guest_manual]" id="checkout_enable" checked="checked" />
                                                    </div>
                                                    <?php } else { ?>
                                                    <div <?php if($IE7==true){ echo""; }else{ echo'class="make-switch" data-on="primary" data-off="default"'; } ?>>
                                                        <input <?php if($IE7==true){ echo'class="checkbox"'; }else{ echo'class="make-switch"'; } ?>  type="checkbox" value="1" name="supercheckout[general][guest_manual]" id="checkout_enable" />
                                                    </div>
                                                    <?php } ?>                    
                                                </td>                                                            
                                            </tr> 
                                            <tr>
                                                <td class="name">
                                                    <span><?php echo $supercheckout_text_general_default; ?></span><i class="icon-question-sign" data-toggle="tooltip"  data-placement="top" data-original-title="<?php echo $general_default_supercheckout_tooltip; ?>"></i>
                                                </td>
                                                <td class="settings">
                                                    <?php if(isset($supercheckout['general']['default_option']) && $supercheckout['general']['default_option'] == 'guest'){ ?>
                                                    <div class="widget-body uniformjs">
                                                        <label class="radio">
                                                            <input class="radio" type="radio" value="guest" name="supercheckout[general][default_option]" checked="checked"  />
                                                            <?php echo $supercheckout_text_guest; ?>
                                                        </label>
                                                        <label class="radio">
                                                            <input class="radio" type="radio" value="register" name="supercheckout[general][default_option]"  />
                                                            <?php echo $supercheckout_text_login; ?>
                                                        </label>
                                                    </div>
                                                    <?php }else{ ?>
                                                    <div class="widget-body uniformjs">
                                                        <input class="radio" type="radio" value="guest" name="supercheckout[general][default_option]" id="general_default_option_guest" /><label  for="general_default_option_guest"><?php echo $supercheckout_text_guest; ?></label>
                                                        <input class="radio" type="radio" value="register" name="supercheckout[general][default_option]" checked="checked"  id="general_default_option_register" /><label  for="general_default_option_register"><?php echo $supercheckout_text_login; ?></label>
                                                    </div>
                                                    <?php } ?>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="name"><span><?php echo $supercheckout_text_step_login_option; ?></span><i class="icon-question-sign" data-toggle="tooltip"  data-placement="top" data-original-title="<?php echo $step_login_option_supercheckout_tooltip; ?>"></i></td>
                                                <?php if($guest_enable){ ?>
                                                <td class="settings ">
                                                    <div class="widget-body uniformjs">
                                                        <input type="hidden" value="0" name="supercheckout[step][login][option][guest][display]" />
                                                        <?php if(isset($supercheckout['step']['login']['option']['guest']['display']) && $supercheckout['step']['login']['option']['guest']['display'] == 1){ ?>
                                                        <input class="checkbox" type="checkbox" value="1" name="supercheckout[step][login][option][guest][display]" checked="checked" id="step_login_option_guest_display"/>
                                                        <?php }else{ ?>
                                                        <input class="checkbox" type="checkbox" value="1" name="supercheckout[step][login][option][guest][display]" id="step_login_option_guest_display" />
                                                        <?php } ?>
                                                        <label for="step_login_option_guest_display"><?php echo $settings_display; ?></label>
                                                    </div>
                                                </td>
                                                <?php }else{ ?>
                                                <td class="settings ">
                                                    <div class="widget-body uniformjs">
                                                        <input type="hidden" value="0" name="supercheckout[step][login][option][guest][display]" />
                                                        <input class="checkbox" type="checkbox" value="1" name="supercheckout[step][login][option][guest][display]" disabled="disabled" id="step_login_option_guest_display" />
                                                        <label for="step_login_option_guest_display"><?php echo $settings_display; ?></label>
                                                        <i class="store_disabled" data-toggle="tooltip"  data-placement="top" data-original-title="<?php echo $guest_enable_disabled_supercheckout_tooltip; ?>"><span class="store_disabled_msg">Warning !</span></i>
                                                    </div>
                                                </td>
                                                <?php } ?>
                                                <td></td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <!------------------------------------Login Options--------------------------->
                                <div id="tab_login" class="tab-pane">
                                    <h3 class="heading-mosaic"><?php echo $supercheckout_text_login; ?></h3>
                                    <div class="block">
                                        <table class="form">
                                            <tbody>
                                               
                                                <tr>
                                                    <td class="name"><span><?php echo $supercheckout_text_facebook_login_display; ?></span><i class="icon-question-sign" data-toggle="tooltip"  data-placement="top" data-original-title="<?php echo $facebook_login_display_supercheckout_tooltip; ?>"></i></td>
                                                    <td>
                                                        <input type="hidden" value="0" name="supercheckout[step][facebook_login][display]" />
                                                        <?php if(isset($supercheckout['step']['facebook_login']['display']) && $supercheckout['step']['facebook_login']['display'] == 1){ ?>
                                                        <div <?php if($IE7==true){ echo""; }else{ echo'class="make-switch" data-on="primary" data-off="default"'; } ?>>
                                                            <input <?php if($IE7==true){ echo'class="checkbox"'; }else{ echo'class="make-switch"'; } ?>  type="checkbox" value="1" name="supercheckout[step][facebook_login][display]" checked="checked"  id="facebook_login_display" />
                                                        </div>
                                                        <?php }else{ ?>
                                                        <div <?php if($IE7==true){ echo""; }else{ echo'class="make-switch" data-on="primary" data-off="default"'; } ?>>
                                                            <input <?php if($IE7==true){ echo'class="checkbox"'; }else{ echo'class="make-switch"'; } ?>  type="checkbox" value="1" name="supercheckout[step][facebook_login][display]"  id="facebook_login_display" />
                                                        </div>
                                                        <?php } ?>
                                                    </td>
                                                </tr>
                                                
                                                <tr>
                                                    <td class="name"><span><?php echo $supercheckout_text_facebook_app_id; ?></span><i class="icon-question-sign" data-toggle="tooltip"  data-placement="top" data-original-title="<?php echo $facebook_app_id_supercheckout_tooltip; ?>"></i></td>
                                                    <td class="settings"><?php if(isset($supercheckout['step']['facebook_login']['app_id']) && $supercheckout['step']['facebook_login']['app_id'] != ""){ ?>
                                                        <input  type="text" class="input-sm form-control col-md-12" value="<?php echo $supercheckout['step']['facebook_login']['app_id']; ?>" name="supercheckout[step][facebook_login][app_id]" id="facebook_login_app_id" class="checkbox"/>
                                                        <?php }else{ ?>
                                                        <input type="text" class="input-sm form-control col-md-12" value="" name="supercheckout[step][facebook_login][app_id]" id="facebook_login_app_id"/>
                                                        <?php } ?>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="name"><span><?php echo $supercheckout_text_facebook_app_secret; ?></span><i class="icon-question-sign" data-toggle="tooltip"  data-placement="top" data-original-title="<?php echo $facebook_secret_supercheckout_tooltip; ?>"></i></td>
                                                    <td class="settings"><?php if(isset($supercheckout['step']['facebook_login']['app_secret']) && $supercheckout['step']['facebook_login']['app_secret'] != ""){ ?>
                                                        <input  class="input-sm form-control col-md-12" type="text" value="<?php echo $supercheckout['step']['facebook_login']['app_secret']; ?>" name="supercheckout[step][facebook_login][app_secret]" id="facebook_login_app_secret" class="checkbox"/>
                                                        <?php }else{ ?>
                                                        <input class="input-sm form-control col-md-12" type="text" value="" name="supercheckout[step][facebook_login][app_secret]" id="facebook_login_app_secret"/>
                                                        <?php } ?>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="name"><span><?php echo $supercheckout_text_google_login_display; ?></span><i class="icon-question-sign" data-toggle="tooltip"  data-placement="top" data-original-title="<?php echo $google_login_display_supercheckout_tooltip; ?>"></i></td>
                                                    <td>
                                                        <input type="hidden" value="0" name="supercheckout[step][google_login][display]" />
                                                        <?php if(isset($supercheckout['step']['google_login']['display']) && $supercheckout['step']['google_login']['display'] == 1){ ?>
                                                        <div <?php if($IE7==true){ echo""; }else{ echo'class="make-switch" data-on="primary" data-off="default"'; } ?>>
                                                            <input <?php if($IE7==true){ echo'class="checkbox"'; }else{ echo'class="make-switch"'; } ?>  type="checkbox" value="1" name="supercheckout[step][google_login][display]" checked="checked"  id="google_login_display" />
                                                        </div>
                                                        <?php }else{ ?>
                                                        <div <?php if($IE7==true){ echo""; }else{ echo'class="make-switch" data-on="primary" data-off="default"'; } ?>>
                                                            <input <?php if($IE7==true){ echo'class="checkbox"'; }else{ echo'class="make-switch"'; } ?>  type="checkbox" value="1" name="supercheckout[step][google_login][display]"  id="google_login_display" />
                                                        </div>
                                                        <?php } ?>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="name"><span><?php echo $supercheckout_text_google_app_id; ?></span><i class="icon-question-sign" data-toggle="tooltip"  data-placement="top" data-original-title="<?php echo $google_app_id_supercheckout_tooltip; ?>"></i></td>
                                                    <td class="settings"><?php if(isset($supercheckout['step']['google_login']['app_id']) && $supercheckout['step']['google_login']['app_id'] != ""){ ?>
                                                        <input class="input-sm form-control col-md-12" type="text" value="<?php echo $supercheckout['step']['google_login']['app_id']; ?>" name="supercheckout[step][google_login][app_id]" id="google_login_app_id" class="checkbox"/>
                                                        <?php }else{ ?>
                                                        <input class="input-sm form-control col-md-12" type="text" value="" name="supercheckout[step][google_login][app_id]" id="google_login_app_id"/>
                                                        <?php } ?>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="name"><span><?php echo $supercheckout_text_google_client_id; ?></span><i class="icon-question-sign" data-toggle="tooltip"  data-placement="top" data-original-title="<?php echo $google_client_id_supercheckout_tooltip; ?>"></i></td>
                                                    <td class="settings"><?php if(isset($supercheckout['step']['google_login']['client_id']) && $supercheckout['step']['google_login']['client_id'] != ""){ ?>
                                                        <input class="input-sm form-control col-md-12" type="text" value="<?php echo $supercheckout['step']['google_login']['client_id']; ?>" name="supercheckout[step][google_login][client_id]" id="google_login_client_id" class="checkbox"/>
                                                        <?php }else{ ?>
                                                        <input class="input-sm form-control col-md-12" type="text" value="" name="supercheckout[step][google_login][client_id]" id="google_login_client_id"/>
                                                        <?php } ?>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="name"><span><?php echo $supercheckout_text_google_app_secret; ?></span><i class="icon-question-sign" data-toggle="tooltip"  data-placement="top" data-original-title="<?php echo $google_secret_supercheckout_tooltip; ?>"></i></td>
                                                    <td class="settings"><?php if(isset($supercheckout['step']['google_login']['app_secret']) && $supercheckout['step']['google_login']['app_secret'] != ""){ ?>
                                                        <input class="input-sm form-control col-md-12" type="text" value="<?php echo $supercheckout['step']['google_login']['app_secret']; ?>" name="supercheckout[step][google_login][app_secret]" id="google_login_app_secret" class="checkbox"/>
                                                        <?php }else{ ?>
                                                        <input class="input-sm form-control col-md-12" type="text" value="" name="supercheckout[step][google_login][app_secret]" id="google_login_app_secret"/>
                                                        <?php } ?>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <!---------------------------------- Payment Address ---------------------------------->
                                <div id="tab_payment_address" class="tab-pane">
                                    <h3 class="heading-mosaic"><?php echo $supercheckout_text_payment_address; ?></h3>
                                    <div class="block">
                                        <table class="form alternate">
                                            <thead>
                                                <tr>
                                                    <th></th>
                                                    <th class="guest"><?php echo $supercheckout_text_guest_customer; ?></th>
                                                    <th class="login"><?php echo $supercheckout_text_logged_in_customer; ?></th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody class="sortable ui-sortable">  
                                                <?php $customer_group_field_array=array('company_id','tax_id')?>
                                                <?php foreach($supercheckout['step']['payment_address']['fields'] as $field) {  ?>
                                                <?php if(isset($field['id'])) if($field['id']!=null){ ?>
                                                <input type="hidden" value="<?php echo $field['id'];?>" name="supercheckout[step][payment_address][fields][<?php echo $field['id']; ?>][id]" />
                                                <input type="hidden" value="<?php echo $field['title'];?>" name="supercheckout[step][payment_address][fields][<?php echo $field['id']; ?>][title]" />
                                                <tr id="payment_address_<?php echo $field['id']; ?>_input" class="sort-item" sort-data="<?php echo (isset($supercheckout['step']['payment_address']['fields'][$field['id']]['sort_order']) ? $supercheckout['step']['payment_address']['fields'][$field['id']]['sort_order'] : ''); ?>">
                                                    <td class="name"><span><?php echo $$field['title']; ?>
                                                            <input class="sort" class="input-sm form-control col-md-12" type="text" value="<?php echo (isset($supercheckout['step']['payment_address']['fields'][$field['id']]['sort_order'])) ? $supercheckout['step']['payment_address']['fields'][$field['id']]['sort_order'] : ''; ?>" name="supercheckout[step][payment_address][fields][<?php echo $field['id']; ?>][sort_order]" />
                                                        </span>
                                                    </td>
                                                    <td >
                                                        <div class="widget-body uniformjs">
                                                            <?php if(isset($supercheckout['option']['guest']['payment_address']['fields'][$field['id']]['display'])) { $show_warning=0; ?>
                                                            <input type="hidden" value="0" name="supercheckout[option][guest][payment_address][fields][<?php echo $field['id']; ?>][display]" />
                                                        <?php if(in_array($field['id'],$customer_group_field_array)){ ?>
                                                            <?php $field_status=$field['id'].'_display'; if($$field_status){  ?>
                                                                <?php if(isset($supercheckout['option']['guest']['payment_address']['fields'][$field['id']]['display']) && $supercheckout['option']['guest']['payment_address']['fields'][$field['id']]['display'] == 1){ ?>
                                                                <label class="checkboxinline">                                  
                                                                    <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][guest][payment_address][fields][<?php echo $field['id']; ?>][display]" checked="checked" id="guest_payment_address_fields_<?php echo $field['id']; ?>_display"/>
                                                                    <?php echo $settings_display; ?>
                                                                </label>
                                                                <?php }else{ ?>
                                                                <label class="checkboxinline">                                  
                                                                    <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][guest][payment_address][fields][<?php echo $field['id']; ?>][display]" id="guest_payment_address_fields_<?php echo $field['id']; ?>_display"/>
                                                                    <?php echo $settings_display; ?>
                                                                </label>
                                                            <?php } }else{ $show_warning=1; ?>
                                                                <label class="checkboxinline">                                  
                                                                    <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][guest][payment_address][fields][<?php echo $field['id']; ?>][display]" disabled="disabled" id="guest_payment_address_fields_<?php echo $field['id']; ?>_display"/>
                                                                    <?php echo $settings_display; ?>
                                                                    
                                                                </label>
                                                            <?php } ?>
                                                            
                                                        <?php }else{ ?>
                                                        <?php if(isset($supercheckout['option']['guest']['payment_address']['fields'][$field['id']]['display']) && $supercheckout['option']['guest']['payment_address']['fields'][$field['id']]['display'] == 1){ ?>
                                                                <label class="checkboxinline">                                  
                                                                    <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][guest][payment_address][fields][<?php echo $field['id']; ?>][display]" checked="checked" id="guest_payment_address_fields_<?php echo $field['id']; ?>_display"/>
                                                                    <?php echo $settings_display; ?>
                                                                </label>
                                                                <?php }else{ ?>
                                                                <label class="checkboxinline">                                  
                                                                    <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][guest][payment_address][fields][<?php echo $field['id']; ?>][display]" id="guest_payment_address_fields_<?php echo $field['id']; ?>_display"/>
                                                                    <?php echo $settings_display; ?>
                                                                </label>
                                                                <?php } ?>
                                                        <?php } ?>
                                                            <?php if(isset($supercheckout['option']['guest']['payment_address']['fields'][$field['id']]['require'])) { ?>
                                                            <input type="hidden" value="0" name="supercheckout[option][guest][payment_address][fields][<?php echo $field['id']; ?>][require]" />
                                                                <?php if(in_array($field['id'],$customer_group_field_array)){ ?>
                                                                    <?php $field_status=$field['id'].'_required'; if($$field_status){  ?>
                                                                            <?php if($supercheckout['option']['guest']['payment_address']['fields'][$field['id']]['require'] == 1){ ?>
                                                                            <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][guest][payment_address][fields][<?php echo $field['id']; ?>][require]" checked="checked" id="guest_payment_address_fields_<?php echo $field['id']; ?>_require"/>
                                                                            <?php }else{ ?>
                                                                            <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][guest][payment_address][fields][<?php echo $field['id']; ?>][require]" id="guest_payment_address_fields_<?php echo $field['id']; ?>_require" />
                                                                            <?php } ?>
                                                                            <label for="guest_payment_address_fields_<?php echo $field['id']; ?>_require"><?php echo $settings_require; ?></label>
                                                                    <?php }else{ $show_warning=1; ?>            
                                                                            <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][guest][payment_address][fields][<?php echo $field['id']; ?>][require]" disabled="disabled" id="guest_payment_address_fields_<?php echo $field['id']; ?>_require_disable" />
                                                                            <label for="guest_payment_address_fields_<?php echo $field['id']; ?>_require"><?php echo $settings_require; ?></label>
                                                                    <?php } ?>
                                                                <?php }else{ ?>            
                                                                            <?php if($supercheckout['option']['guest']['payment_address']['fields'][$field['id']]['require'] == 1){ ?>
                                                                            <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][guest][payment_address][fields][<?php echo $field['id']; ?>][require]" checked="checked" id="guest_payment_address_fields_<?php echo $field['id']; ?>_require"/>
                                                                            <?php }else{ ?>
                                                                            <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][guest][payment_address][fields][<?php echo $field['id']; ?>][require]" id="guest_payment_address_fields_<?php echo $field['id']; ?>_require" />
                                                                            <?php } ?>
                                                                            <label for="guest_payment_address_fields_<?php echo $field['id']; ?>_require"><?php echo $settings_require; ?></label>
                                                                <?php } ?>
                                                            <?php } ?>
                                                        <?php } ?>
                                                            <?php if($show_warning){ ?>
                                                                <i class="store_disabled" data-toggle="tooltip"  data-placement="top" data-original-title="<?php echo $field_disabled_supercheckout_tooltip; ?>"><span class="store_disabled_msg">Warning !</span></i>
                                                            <?php } ?>
                                                        </div>
                                                    </td>
                                                    <td >
                                                        <div class="widget-body uniformjs">
                                                            <?php if(isset($supercheckout['option']['logged']['payment_address']['fields'][$field['id']]['display'])) { ?>
                                                            <input type="hidden" value="0" name="supercheckout[option][logged][payment_address][fields][<?php echo $field['id']; ?>][display]" />
                                                            <?php if(in_array($field['id'],$customer_group_field_array)){ ?>
                                                                    <?php $field_status=$field['id'].'_display'; if($$field_status){  ?>
                                                                        <?php if(isset($supercheckout['option']['logged']['payment_address']['fields'][$field['id']]['display']) && $supercheckout['option']['logged']['payment_address']['fields'][$field['id']]['display'] == 1){ ?>
                                                                        <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][logged][payment_address][fields][<?php echo $field['id']; ?>][display]" checked="checked" id="logged_payment_address_fields_<?php echo $field['id']; ?>_display"/>
                                                                        <?php }else{ ?>
                                                                        <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][logged][payment_address][fields][<?php echo $field['id']; ?>][display]" id="logged_payment_address_fields_<?php echo $field['id']; ?>_display" />
                                                                        <?php } ?>
                                                                    <?php }else{ ?>
                                                                        <input class="checkbox" type="checkbox" value="1" disabled="disabled" name="supercheckout[option][logged][payment_address][fields][<?php echo $field['id']; ?>][display]" id="logged_payment_address_fields_<?php echo $field['id']; ?>_display" />
                                                                    <?php } ?>
                                                            <?php }else{ ?>
                                                                <?php if(isset($supercheckout['option']['logged']['payment_address']['fields'][$field['id']]['display']) && $supercheckout['option']['logged']['payment_address']['fields'][$field['id']]['display'] == 1){ ?>
                                                                <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][logged][payment_address][fields][<?php echo $field['id']; ?>][display]" checked="checked" id="logged_payment_address_fields_<?php echo $field['id']; ?>_display"/>
                                                                <?php }else{ ?>
                                                                <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][logged][payment_address][fields][<?php echo $field['id']; ?>][display]" id="logged_payment_address_fields_<?php echo $field['id']; ?>_display" />
                                                                <?php } ?>
                                                            <?php } ?>
                                                            <label for="logged_payment_address_fields_<?php echo $field['id']; ?>_display"><?php echo $settings_display; ?></label>
                                                            <?php if(isset($supercheckout['option']['logged']['payment_address']['fields'][$field['id']]['require'])) { ?>
                                                            <input type="hidden" value="0" name="supercheckout[option][logged][payment_address][fields][<?php echo $field['id']; ?>][require]" />
                                                            <?php if(in_array($field['id'],$customer_group_field_array)){ ?>
                                                                    <?php $field_status=$field['id'].'_required'; if($$field_status){  ?>
                                                                        <?php if($supercheckout['option']['logged']['payment_address']['fields'][$field['id']]['require'] == 1){ ?>
                                                                        <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][logged][payment_address][fields][<?php echo $field['id']; ?>][require]" checked="checked" id="logged_payment_address_fields_<?php echo $field['id']; ?>_require"/>
                                                                        <?php }else{ ?>
                                                                        <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][logged][payment_address][fields][<?php echo $field['id']; ?>][require]" id="logged_payment_address_fields_<?php echo $field['id']; ?>_require" />
                                                                        <?php } ?>
                                                                    <?php }else{ $show_warning=1; ?>
                                                                        <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][logged][payment_address][fields][<?php echo $field['id']; ?>][require]" disabled="disabled" id="logged_payment_address_fields_<?php echo $field['id']; ?>_require_disable" />
                                                                    <?php } ?>
                                                             <?php }else{ ?>
                                                                <?php if($supercheckout['option']['logged']['payment_address']['fields'][$field['id']]['require'] == 1){ ?>
                                                                        <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][logged][payment_address][fields][<?php echo $field['id']; ?>][require]" checked="checked" id="logged_payment_address_fields_<?php echo $field['id']; ?>_require"/>
                                                                        <?php }else{ ?>
                                                                        <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][logged][payment_address][fields][<?php echo $field['id']; ?>][require]" id="logged_payment_address_fields_<?php echo $field['id']; ?>_require" />
                                                                        <?php } ?>
                                                             <?php } ?>
                                                            <label for="logged_payment_address_fields_<?php echo $field['id']; ?>_require"><?php echo $settings_require; ?></label>
                                                            <?php } ?>
                                                            <?php } ?>
                                                            <?php if($show_warning){ ?>
                                                                <i class="store_disabled" data-toggle="tooltip"  data-placement="top" data-original-title="<?php echo $field_disabled_supercheckout_tooltip; ?>"><span class="store_disabled_msg">Warning !</span></i>
                                                            <?php } ?>
                                                        </div>
                                                    </td>
                                                    <td class="reorder">
                                                        <i class="icon-reorder"></i>
                                                    </td>
                                                </tr>          
                                                <?php } ?>
                                                <?php } /*foreach fields*/?>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <!---------------------------------- Shipping Address ---------------------------------->
                                <div id="tab_shipping_address" class="tab-pane">
                                    <h3 class="heading-mosaic"><?php echo $supercheckout_text_shipping_address; ?></h3>
                                    <div class="block">
                                        <table class="form alternate">
                                            <thead>
                                                <tr>
                                                    <th></th>
                                                    <th class="guest"><?php echo $supercheckout_text_guest_customer; ?></th>
                                                    <th class="login"><?php echo $supercheckout_text_logged_in_customer; ?></th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody class="sortable ui-sortable">    
                                                <?php foreach($supercheckout['step']['shipping_address']['fields'] as $field){ ?>
                                                    <input type="hidden" value="<?php echo $field['id'];?>" name="supercheckout[step][shipping_address][fields][<?php echo $field['id']; ?>][id]" />
                                                    <input type="hidden" value="<?php echo $field['title'];?>" name="supercheckout[step][shipping_address][fields][<?php echo $field['id']; ?>][title]" />
                                                <tr id="shipping_address_<?php echo $field['id']; ?>_input" class="sort-item" sort-data="<?php echo (isset($supercheckout['step']['shipping_address']['fields'][$field['id']]['sort_order']) ? $supercheckout['step']['shipping_address']['fields'][$field['id']]['sort_order'] : ''); ?>">
                                                    <td class="name">
                                                        <span><?php echo $$field['title']; ?>
                                                            <input class="sort" class="input-sm form-control col-md-12" type="text" value="<?php echo (isset($supercheckout['step']['shipping_address']['fields'][$field['id']]['sort_order'])) ? $supercheckout['step']['shipping_address']['fields'][$field['id']]['sort_order'] : ''; ?>" name="supercheckout[step][shipping_address][fields][<?php echo $field['id']; ?>][sort_order]" />
                                                        </span>
                                                    </td>
                                                    <td>
                                                        <div class="widget-body uniformjs">
                                                        <?php if(isset($supercheckout['option']['guest']['shipping_address']['fields'][$field['id']]['display'])) { ?>
                                                        <input type="hidden" value="0" name="supercheckout[option][guest][shipping_address][fields][<?php echo $field['id']; ?>][display]" />
                                                        <?php if(isset($supercheckout['option']['guest']['shipping_address']['fields'][$field['id']]['display']) && $supercheckout['option']['guest']['shipping_address']['fields'][$field['id']]['display'] == 1){ ?>
                                                        <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][guest][shipping_address][fields][<?php echo $field['id']; ?>][display]" checked="checked" id="guest_shipping_address_fields_<?php echo $field['id']; ?>_display"/>
                                                        <?php } else { ?>
                                                        <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][guest][shipping_address][fields][<?php echo $field['id']; ?>][display]" id="guest_shipping_address_fields_<?php echo $field['id']; ?>_display" />
                                                        <?php } ?>
                                                        <label for="guest_shipping_address_fields_<?php echo $field['id']; ?>_display"><?php echo $settings_display; ?></label>
                                                        <?php if(isset($supercheckout['option']['guest']['shipping_address']['fields'][$field['id']]['require'])) { ?>
                                                        <input type="hidden" value="0" name="supercheckout[option][guest][shipping_address][fields][<?php echo $field['id']; ?>][require]" />
                                                        <?php if($supercheckout['option']['guest']['shipping_address']['fields'][$field['id']]['require'] == 1){ ?>
                                                        <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][guest][shipping_address][fields][<?php echo $field['id']; ?>][require]" checked="checked" id="guest_shipping_address_fields_<?php echo $field['id']; ?>_require"/>
                                                        <?php }else{ ?>
                                                        <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][guest][shipping_address][fields][<?php echo $field['id']; ?>][require]" id="guest_shipping_address_fields_<?php echo $field['id']; ?>_require" />
                                                        <?php } ?>
                                                        <label for="guest_shipping_address_fields_<?php echo $field['id']; ?>_require"><?php echo $settings_require; ?></label>
                                                        <?php } ?>
                                                        <?php } ?>
                                                        </div>
                                                    </td>
                                                    <td>
                                                        <div class="widget-body uniformjs">
                                                            <?php if(isset($supercheckout['option']['logged']['shipping_address']['fields'][$field['id']]['display'])) { ?>
                                                            <input type="hidden" value="0" name="supercheckout[option][logged][shipping_address][fields][<?php echo $field['id']; ?>][display]" />
                                                            <?php if(isset($supercheckout['option']['logged']['shipping_address']['fields'][$field['id']]['display']) && $supercheckout['option']['logged']['shipping_address']['fields'][$field['id']]['display'] == 1){ ?>
                                                            <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][logged][shipping_address][fields][<?php echo $field['id']; ?>][display]" checked="checked" id="logged_shipping_address_fields_<?php echo $field['id']; ?>_display"/>
                                                            <?php }else{ ?>
                                                            <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][logged][shipping_address][fields][<?php echo $field['id']; ?>][display]" id="logged_shipping_address_fields_<?php echo $field['id']; ?>_display" />
                                                            <?php } ?>
                                                            <label for="logged_shipping_address_fields_<?php echo $field['id']; ?>_display"><?php echo $settings_display; ?></label>
                                                            <?php if(isset($supercheckout['option']['logged']['shipping_address']['fields'][$field['id']]['require'])) { ?>
                                                            <input type="hidden" value="0" name="supercheckout[option][logged][shipping_address][fields][<?php echo $field['id']; ?>][require]" />
                                                            <?php if($supercheckout['option']['logged']['shipping_address']['fields'][$field['id']]['require'] == 1){ ?>
                                                            <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][logged][shipping_address][fields][<?php echo $field['id']; ?>][require]" checked="checked" id="logged_shipping_address_fields_<?php echo $field['id']; ?>_require"/>
                                                            <?php }else{ ?>
                                                            <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][logged][shipping_address][fields][<?php echo $field['id']; ?>][require]" id="logged_shipping_address_fields_<?php echo $field['id']; ?>_require" />
                                                            <?php } ?>
                                                            <label for="logged_shipping_address_fields_<?php echo $field['id']; ?>_require"><?php echo $settings_require; ?></label>
                                                            <?php } ?>
                                                            <?php } ?>
                                                        </div>
                                                    </td>
                                                    <td class="reorder">
                                                        <i class="icon-reorder"></i>
                                                    </td>
                                                </tr>
                                    <?php } ?>
                                    </tbody>
                                    </table>
                                </div>
                            </div>
                            <!---------------------------------- Shipping Methods ---------------------------------->
                            <div id="tab_shipping" class="tab-pane">
                                <h3 class="heading-mosaic"><?php echo $supercheckout_text_shipping_method; ?></h3>
                                <div class="block">
                                    <table class="form">
                                        <tbody>
                                            <tr>
                                                <td class="name"><span><?php echo $supercheckout_text_shipping_method_display_options; ?></span><i class="icon-question-sign" data-toggle="tooltip"  data-placement="top" data-original-title="<?php echo $shipping_method_display_options_supercheckout_tooltip; ?>"></i></td>
                                                <td>
                                                    <input type="hidden" value="0" name="supercheckout[step][shipping_method][display_options]" />
                                                    <?php if(isset($supercheckout['step']['shipping_method']['display_options']) && $supercheckout['step']['shipping_method']['display_options'] == 1){ ?>
                                                    <div <?php if($IE7==true){ echo""; }else{ echo'class="make-switch" data-on="primary" data-off="default"'; } ?>>
                                                        <input <?php if($IE7==true){ echo'class="checkbox"'; }else{ echo'class="make-switch"'; } ?> type="checkbox" value="1" name="supercheckout[step][shipping_method][display_options]" checked="checked"  id="shipping_method_display_options" />
                                                    </div>
                                                    <?php }else{ ?>
                                                    <div <?php if($IE7==true){ echo""; }else{ echo'class="make-switch" data-on="primary" data-off="default"'; } ?>>
                                                        <input <?php if($IE7==true){ echo'class="checkbox"'; }else{ echo'class="make-switch"'; } ?>  type="checkbox" value="1" name="supercheckout[step][shipping_method][display_options]"  id="shipping_method_display_options" />
                                                    </div>
                                                    <?php } ?>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="name"><span><?php echo $supercheckout_text_shipping_method_display_title; ?></span><i class="icon-question-sign" data-toggle="tooltip"  data-placement="top" data-original-title="<?php echo $shipping_method_display_title_supercheckout_tooltip; ?>"></i></td>
                                                <td>
                                                    <input type="hidden" value="0" name="supercheckout[step][shipping_method][display_title]" />
                                                    <?php if(isset($supercheckout['step']['shipping_method']['display_title']) && $supercheckout['step']['shipping_method']['display_title'] == 1){ ?>
                                                    <div <?php if($IE7==true){ echo""; }else{ echo'class="make-switch" data-on="primary" data-off="default"'; } ?>>
                                                        <input <?php if($IE7==true){ echo'class="checkbox"'; }else{ echo'class="make-switch"'; } ?>  type="checkbox" value="1" name="supercheckout[step][shipping_method][display_title]" checked="checked"  id="shipping_method_display_title" />
                                                    </div>
                                                    <?php }else{ ?>
                                                    <div <?php if($IE7==true){ echo""; }else{ echo'class="make-switch" data-on="primary" data-off="default"'; } ?>>
                                                        <input <?php if($IE7==true){ echo'class="checkbox"'; }else{ echo'class="make-switch"'; } ?>  type="checkbox" value="1" name="supercheckout[step][shipping_method][display_title]"  id="shipping_method_display_title" />
                                                    </div>
                                                    <?php } ?>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="name"><span><?php echo $supercheckout_text_shipping_method_default_option; ?></span><i class="icon-question-sign" data-toggle="tooltip"  data-placement="top" data-original-title="<?php echo $shipping_method_default_option_supercheckout_tooltip; ?>"></i></td>
                                                <td>
                                                    <select class="selectpicker col-md-5"  name="supercheckout[step][shipping_method][default_option]">
                                                        <?php $i=0; foreach ($shipping_methods as $shipping_method) {?>
                                                            <?php if(isset($supercheckout['step']['shipping_method']['default_option']) && $supercheckout['step']['shipping_method']['default_option'] == $shipping_method['code'] && $i!=0){ ?>
                                                            <option value="<?php echo $shipping_method['code']; ?>" selected="selected"><?php echo $shipping_method['title']; ?></option>
                                                            <?php }else{ ?>
                                                        <option value="<?php echo $shipping_method['code']; ?>"><?php echo $shipping_method['title']; ?></option>
                                                        <?php } $i++; ?>
                                                        <?php } ?>
                                                    </select>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                               
                            <!---------------------------------- Payment Methods ---------------------------------->
                            <div id="tab_payment" class="tab-pane">
                                <h3 class="heading-mosaic"><?php echo $supercheckout_text_payment_method; ?></h3>
                                <div class="block">
                                    <table class="form">
                                        <tbody>
                                            <tr>
                                                <td class="name"><span><?php echo $supercheckout_text_payment_method_display_options; ?></span><i class="icon-question-sign" data-toggle="tooltip"  data-placement="top" data-original-title="<?php echo $payment_method_display_options_supercheckout_tooltip; ?>"></i></td>
                                                <td>
                                                    <input type="hidden" value="0" name="supercheckout[step][payment_method][display_options]" />
                                                    <?php if(isset($supercheckout['step']['payment_method']['display_options']) && $supercheckout['step']['payment_method']['display_options'] == 1){ ?>
                                                    <div <?php if($IE7==true){ echo""; }else{ echo'class="make-switch" data-on="primary" data-off="default"'; } ?>>
                                                        <input <?php if($IE7==true){ echo'class="checkbox"'; }else{ echo'class="make-switch"'; } ?>  type="checkbox" value="1" name="supercheckout[step][payment_method][display_options]" checked="checked"  id="payment_method_display_options" />
                                                    </div>
                                                    <?php }else{ ?>
                                                    <div <?php if($IE7==true){ echo""; }else{ echo'class="make-switch" data-on="primary" data-off="default"'; } ?>>
                                                        <input <?php if($IE7==true){ echo'class="checkbox"'; }else{ echo'class="make-switch"'; } ?>  type="checkbox" value="1" name="supercheckout[step][payment_method][display_options]"  id="payment_method_display_options" />
                                                    </div>
                                                    <?php } ?>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="name"><span><?php echo $supercheckout_text_payment_method_default_option; ?></span><i class="icon-question-sign" data-toggle="tooltip"  data-placement="top" data-original-title="<?php echo $payment_method_default_option_supercheckout_tooltip; ?>"></i></td>
                                                <td>
                                                    <select class="selectpicker col-md-5" name="supercheckout[step][payment_method][default_option]">
                                                        <?php $i=0; foreach ($payment_methods as $payment_method) {?>
                                                            <?php if(isset($supercheckout['step']['payment_method']['default_option']) && ($supercheckout['step']['payment_method']['default_option'] == $payment_method['code'])&& $i!=0){ ?>
                                                            <option value="<?php echo $payment_method['code']; ?>" selected="selected"><?php echo $payment_method['title']; ?></option>
                                                            <?php }else{ ?>
                                                        <option value="<?php echo $payment_method['code']; ?>"><?php echo $payment_method['title']; ?></option>
                                                        <?php } $i++; ?>
                                                        <?php } ?>
                                                    </select>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                                
                            <!---------------------------------- Confirm ---------------------------------->                            
                            
                            
                            <div id="tab_confirm" class="tab-pane">
                                <h3 class="heading-mosaic"><?php echo $supercheckout_text_cart; ?></h3>
                                <div class="block">
                                    <table class="form alternate">
                                        <th></th>
                                        <th class="guest"><?php echo $supercheckout_text_guest_customer; ?></th>
                                        <th class="login"><?php echo $supercheckout_text_logged_in_customer; ?></th>
                                        <tbody>
                                            <tr>
                                                <td class="name"><span><?php echo $supercheckout_text_cart_display; ?></span><i class="icon-question-sign" data-toggle="tooltip"  data-placement="top" data-original-title="<?php echo $cart_display_supercheckout_tooltip; ?>"></i></td>
                                                <td>
                                                    <div class="widget-body uniformjs">
                                                        <input type="hidden" value="0" name="supercheckout[option][guest][cart][display]" />
                                                        <?php if(isset($supercheckout['option']['guest']['cart']['display']) && $supercheckout['option']['guest']['cart']['display'] == 1){ ?>
                                                        <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][guest][cart][display]" checked="checked"  id="option_guest_cart_display" />
                                                        <?php }else{ ?>
                                                        <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][guest][cart][display]"  id="option_guest_cart_display" />
                                                        <?php } ?> <label for="option_guest_cart_display"><?php echo $settings_display; ?></label>
                                                    </div>
                                                </td>
                                                <td><input type="hidden" value="0" name="supercheckout[option][logged][cart][display]" />
                                                    <div class="widget-body uniformjs">
                                                        <?php if(isset($supercheckout['option']['logged']['cart']['display']) && $supercheckout['option']['logged']['cart']['display'] == 1){ ?>
                                                        <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][logged][cart][display]" checked="checked"  id="option_logged_cart_display" />
                                                        <?php }else{ ?>
                                                        <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][logged][cart][display]"  id="option_logged_cart_display" />
                                                        <?php } ?> <label for="option_logged_cart_display"><?php echo $settings_display; ?></label>
                                                    </div>
                                                </td>
                                            </tr>
                                            <?php $fields = array('image', 'name','model', 'quantity', 'price', 'total');?>
                                            <?php foreach($fields as $field){ ?>
                                            <tr>
                                                <td class="name"><span><?php $field_name = 'supercheckout_text_cart_columns_'.$field; echo $$field_name;  ?></span></td>
                                                <td>
                                                    <div class="widget-body uniformjs">
                                                        <input type="hidden" value="0" name="supercheckout[option][guest][cart][columns][<?php echo $field; ?>]" />
                                                        <?php if(isset($supercheckout['option']['guest']['cart']['columns'][$field]) && $supercheckout['option']['guest']['cart']['columns'][$field] == 1){ ?>
                                                        <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][guest][cart][columns][<?php echo $field; ?>]" checked="checked"  id="option_guest_cart_columns_<?php echo $field; ?>" />
                                                        <?php }else{ ?>
                                                        <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][guest][cart][columns][<?php echo $field; ?>]"  id="option_guest_cart_columns_<?php echo $field; ?>"/>
                                                        <?php } ?> <label for="option_guest_cart_columns_<?php echo $field; ?>"><?php echo $settings_display; ?></label>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="widget-body uniformjs">
                                                        <input type="hidden" value="0" name="supercheckout[option][logged][cart][columns][<?php echo $field; ?>]" />
                                                        <?php if(isset($supercheckout['option']['logged']['cart']['columns'][$field]) && $supercheckout['option']['logged']['cart']['columns'][$field] == 1){ ?>
                                                        <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][logged][cart][columns][<?php echo $field; ?>]" checked="checked"  id="option_logged_cart_columns_<?php echo $field; ?>" />
                                                        <?php }else{ ?>
                                                        <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][logged][cart][columns][<?php echo $field; ?>]"  id="option_logged_cart_columns_<?php echo $field; ?>" />
                                                        <?php } ?> <label for="option_logged_cart_columns_<?php echo $field; ?>"><?php echo $settings_display; ?></label>
                                                    </div>
                                                </td>
                                            </tr>
                                            
                                            <?php } ?>
                                            
                                            
                                            <tr>
                                                <td class="name"><span><?php echo $supercheckout_text_cart_option_coupon;  ?></span><i class="icon-question-sign" data-toggle="tooltip"  data-placement="top" data-original-title="<?php $field_name = 'cart_option_coupon_supercheckout_tooltip'; echo $$field_name; ?>"></i></td>
                                                <?php if($coupon_status){ ?>
                                                <td>
                                                    <div class="widget-body uniformjs">
                                                        <input type="hidden" value="0" name="supercheckout[option][guest][cart][option][coupon][display]" />
                                                        <?php if(isset($supercheckout['option']['guest']['cart']['option']['coupon']['display']) && $supercheckout['option']['guest']['cart']['option']['coupon']['display'] == 1){ ?>
                                                        <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][guest][cart][option][coupon][display]" checked="checked"  id="option_guest_cart_option_coupon_display" />
                                                        <?php }else{ ?>
                                                        <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][guest][cart][option][coupon][display]"  id="option_guest_cart_option_coupon_display"/>
                                                        <?php } ?> <label for="option_guest_cart_option_coupon_display"><?php echo $settings_display; ?></label>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="widget-body uniformjs">
                                                        <input type="hidden" value="0" name="supercheckout[option][logged][cart][option][coupon][display]" />
                                                        <?php if(isset($supercheckout['option']['logged']['cart']['option']['coupon']['display']) && $supercheckout['option']['logged']['cart']['option']['coupon']['display'] == 1){ ?>
                                                        <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][logged][cart][option][coupon][display]" checked="checked"  id="option_logged_cart_option_coupon_display" />
                                                        <?php }else{ ?>
                                                        <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][logged][cart][option][coupon][display]"  id="option_logged_cart_option_coupon_display" />
                                                        <?php } ?> <label for="option_logged_cart_option_coupon_display"><?php echo $settings_display; ?></label>
                                                    </div>
                                                </td>
                                                <?php }else{ ?>
                                                <td>
                                                    <div class="widget-body uniformjs">
                                                        <input type="hidden" value="0" name="supercheckout[option][guest][cart][option][coupon][display]" />
                                                        <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][guest][cart][option][coupon][display]" disabled="disabled"  id="option_guest_cart_option_coupon_display"/>
                                                        <label for="option_guest_cart_option_coupon_display"><?php echo $settings_display; ?></label>
                                                        <i class="store_disabled" data-toggle="tooltip"  data-placement="top" data-original-title="<?php echo $cart_option_coupon_disabled_supercheckout_tooltip; ?>"><span class="store_disabled_msg">Warning !</span></i>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="widget-body uniformjs">
                                                        <input type="hidden" value="0" name="supercheckout[option][logged][cart][option][coupon][display]" />
                                                        <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][logged][cart][option][coupon][display]"  disabled="disabled" id="option_logged_cart_option_coupon_display" />
                                                        <label for="option_logged_cart_option_coupon_display"><?php echo $settings_display; ?></label>
                                                        <i class="store_disabled" data-toggle="tooltip"  data-placement="top" data-original-title="<?php echo $cart_option_coupon_disabled_supercheckout_tooltip; ?>"><span class="store_disabled_msg">Warning !</span></i>
                                                    </div>
                                                </td>
                                                <?php } ?>
                                            </tr>
                                            
                                            <tr>
                                                <td class="name"><span><?php  echo $supercheckout_text_cart_option_voucher;  ?></span><i class="icon-question-sign" data-toggle="tooltip"  data-placement="top" data-original-title="<?php $field_name = 'cart_option_voucher_supercheckout_tooltip'; echo $field_name; ?>"></i></td>
                                                <?php if($voucher_status){ ?>
                                                <td>
                                                    <div class="widget-body uniformjs">
                                                        <input type="hidden" value="0" name="supercheckout[option][guest][cart][option][voucher][display]" />
                                                        <?php if(isset($supercheckout['option']['guest']['cart']['option']['voucher']['display']) && $supercheckout['option']['guest']['cart']['option']['voucher']['display'] == 1){ ?>
                                                        <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][guest][cart][option][voucher][display]" checked="checked"  id="option_guest_cart_option_voucher_display" />
                                                        <?php }else{ ?>
                                                        <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][guest][cart][option][voucher][display]"  id="option_guest_cart_option_voucher_display"/>
                                                        <?php } ?> <label for="option_guest_cart_option_voucher_display"><?php echo $settings_display; ?></label>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="widget-body uniformjs">
                                                        <input type="hidden" value="0" name="supercheckout[option][logged][cart][option][voucher][display]" />
                                                        <?php if(isset($supercheckout['option']['logged']['cart']['option']['voucher']['display']) && $supercheckout['option']['logged']['cart']['option']['voucher']['display'] == 1){ ?>
                                                        <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][logged][cart][option][voucher][display]" checked="checked"  id="option_logged_cart_option_voucher_display" />
                                                        <?php }else{ ?>
                                                        <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][logged][cart][option][voucher][display]"   id="option_logged_cart_option_voucher_display" />
                                                        <?php } ?> <label for="option_logged_cart_option_voucher_display"><?php echo $settings_display; ?></label>
                                                    </div>
                                                </td>
                                                <?php }else{ ?>
                                                <td>
                                                    <div class="widget-body uniformjs">
                                                        <input type="hidden" value="0" name="supercheckout[option][guest][cart][option][voucher][display]" />
                                                        <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][guest][cart][option][voucher][display]" disabled="disabled" id="option_guest_cart_option_voucher_display"/>
                                                        <label for="option_guest_cart_option_voucher_display"><?php echo $settings_display; ?></label>
                                                        <i class="store_disabled" data-toggle="tooltip"  data-placement="top" data-original-title="<?php echo $cart_option_voucher_disabled_supercheckout_tooltip; ?>"><span class="store_disabled_msg">Warning !</span></i>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="widget-body uniformjs">
                                                        <input type="hidden" value="0" name="supercheckout[option][logged][cart][option][voucher][display]" />
                                                        <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][logged][cart][option][voucher][display]" disabled="disabled"  id="option_logged_cart_option_voucher_display" />
                                                        <label for="option_logged_cart_option_voucher_display"><?php echo $settings_display; ?></label>
                                                        <i class="store_disabled" data-toggle="tooltip"  data-placement="top" data-original-title="<?php echo $cart_option_voucher_disabled_supercheckout_tooltip; ?>"><span class="store_disabled_msg">Warning !</span></i>
                                                    </div>
                                                </td>
                                                <?php } ?>
                                            </tr>   
                                            
                                            <tr>
                                                <td class="name"><span><?php echo $supercheckout_text_image_size; ?></span><i class="icon-question-sign" data-toggle="tooltip"  data-placement="top" data-original-title="<?php echo $image_size_supercheckout_tooltip; ?>"></i></td>
                                                <td class="settings"><?php if(isset($supercheckout['step']['cart']['image_width']) && $supercheckout['step']['cart']['image_width'] != ""){ ?>
                                                    <input  type="text" class="input-sm  col-md-2" value="<?php echo $supercheckout['step']['cart']['image_width']; ?>" name="supercheckout[step][cart][image_width]" id="image_width_id" class="checkbox"/>
                                                    <?php }else{ ?>
                                                    <input type="text" class="input-sm col-md-2" value="" name="supercheckout[step][cart][image_width]" id="image_width_id"/>
                                                    <?php } ?>                                                                    
                                                    <?php if(isset($supercheckout['step']['cart']['image_height']) && $supercheckout['step']['cart']['image_height'] != ""){ ?>
                                                    <input  type="text" class="input-sm col-md-2" value="<?php echo $supercheckout['step']['cart']['image_height']; ?>" name="supercheckout[step][cart][image_height]" id="image_height_id" class="checkbox"/>
                                                    <?php }else{ ?>
                                                    <input type="text" class="input-sm col-md-2" value="" name="supercheckout[step][cart][image_height]" id="image_height_id"/>
                                                    <?php } ?>
                                                </td>
                                                <td></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div class="title"><i class="icon-confirm"></i><span><?php echo $supercheckout_text_confirm; ?></span></div>
                                    <table class="form alternate">
                                        <th></th>
                                        <th class="guest"><?php echo $supercheckout_text_guest_customer; ?></th>
                                        <th class="login"><?php echo $supercheckout_text_logged_in_customer; ?></th>
                                        <tbody>
                                        <tbody class="sortable ui-sortable">
                                            <?php foreach($supercheckout['step']['confirm']['fields'] as $field){ ?>
                            <input type="hidden" value="<?php echo $field['id'];?>" name="supercheckout[step][confirm][fields][<?php echo $field['id']; ?>][id]" />
                            <input type="hidden" value="<?php echo $field['title'];?>" name="supercheckout[step][confirm][fields][<?php echo $field['id']; ?>][title]" />
                                                <tr id="confirm_<?php echo $field['id']; ?>_input" class="sort-item" sort-data="<?php echo (isset($supercheckout['step']['confirm']['fields'][$field['id']]['sort_order']) ? $supercheckout['step']['confirm']['fields'][$field['id']]['sort_order'] : ''); ?>">
                                                <td class="name"><span><?php echo $$field['title']; ?>
                                                        <input class="sort" class="input-sm form-control col-md-12" type="text" value="<?php echo (isset($supercheckout['step']['confirm']['fields'][$field['id']]['sort_order'])) ? $supercheckout['step']['confirm']['fields'][$field['id']]['sort_order'] : ''; ?>" name="supercheckout[step][confirm][fields][<?php echo $field['id']; ?>][sort_order]" />
                                                    </span>
                                                </td>
                                                <td >
                                                    <div class="widget-body uniformjs">
                                                        <?php $show_warning=0; if(isset($supercheckout['option']['guest']['confirm']['fields'][$field['id']]['display'])) { ?>
                                                        <input type="hidden" value="0" name="supercheckout[option][guest][confirm][fields][<?php echo $field['id']; ?>][display]" />
                                                        <?php if($field['id']=='agree'){ ?>
                                                        <?php if($text_agree){ ?>
                                                            <?php if(isset($supercheckout['option']['guest']['confirm']['fields'][$field['id']]['display']) && $supercheckout['option']['guest']['confirm']['fields'][$field['id']]['display'] == 1){ ?>
                                                            <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][guest][confirm][fields][<?php echo $field['id']; ?>][display]" checked="checked" id="guest_confirm_fields_<?php echo $field['id']; ?>_display"/>
                                                            <?php }else{ ?>
                                                            <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][guest][confirm][fields][<?php echo $field['id']; ?>][display]" id="guest_confirm_fields_<?php echo $field['id']; ?>_display" />
                                                            <?php } ?>
                                                         <?php }else{ $show_warning=1;?>   
                                                         <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][guest][confirm][fields][<?php echo $field['id']; ?>][display]" disabled="disabled" id="guest_confirm_fields_<?php echo $field['id']; ?>_display" />
                                                         <?php } ?>
                                                        <?php }else{ ?>
                                                            <?php if(isset($supercheckout['option']['guest']['confirm']['fields'][$field['id']]['display']) && $supercheckout['option']['guest']['confirm']['fields'][$field['id']]['display'] == 1){ ?>
                                                            <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][guest][confirm][fields][<?php echo $field['id']; ?>][display]" checked="checked" id="guest_confirm_fields_<?php echo $field['id']; ?>_display"/>
                                                            <?php }else{ ?>
                                                            <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][guest][confirm][fields][<?php echo $field['id']; ?>][display]" id="guest_confirm_fields_<?php echo $field['id']; ?>_display" />
                                                            <?php } ?>
                                                        <?php } ?>
                                                        <label for="guest_confirm_fields_<?php echo $field['id']; ?>_display"><?php echo $settings_display; ?></label>
                                                        <?php if(isset($supercheckout['option']['guest']['confirm']['fields'][$field['id']]['require'])) { ?>
                                                        <input type="hidden" value="0" name="supercheckout[option][guest][confirm][fields][<?php echo $field['id']; ?>][require]" />
                                                        <?php if($field['id']=='agree'){ ?>
                                                        <?php if($text_agree){ ?>
                                                            <?php if($supercheckout['option']['guest']['confirm']['fields'][$field['id']]['require'] == 1){ ?>
                                                            <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][guest][confirm][fields][<?php echo $field['id']; ?>][require]" checked="checked" id="guest_confirm_fields_<?php echo $field['id']; ?>_require"/>
                                                            <?php }else{ ?>
                                                            <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][guest][confirm][fields][<?php echo $field['id']; ?>][require]" id="guest_confirm_fields_<?php echo $field['id']; ?>_require" />
                                                            <?php } ?>
                                                        <?php }else{ ?>
                                                        <input class="checkbox" type="checkbox" value="1" disabled="disabled" name="supercheckout[option][guest][confirm][fields][<?php echo $field['id']; ?>][require]" id="guest_confirm_fields_<?php echo $field['id']; ?>_require_disabled" />
                                                        <?php } ?>
                                                        <?php }else{ ?>
                                                            <?php if($supercheckout['option']['guest']['confirm']['fields'][$field['id']]['require'] == 1){ ?>
                                                            <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][guest][confirm][fields][<?php echo $field['id']; ?>][require]" checked="checked" id="guest_confirm_fields_<?php echo $field['id']; ?>_require"/>
                                                            <?php }else{ ?>
                                                            <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][guest][confirm][fields][<?php echo $field['id']; ?>][require]" id="guest_confirm_fields_<?php echo $field['id']; ?>_require" />
                                                            <?php } ?>
                                                        <?php } ?>
                                                        <label for="guest_confirm_fields_<?php echo $field['id']; ?>_require"><?php echo $settings_require; ?></label>
                                                        <?php } ?>
                                                        <?php if($show_warning){ ?>
                                                            <i class="store_disabled" data-toggle="tooltip"  data-placement="top" data-original-title="<?php echo $field_disabled_supercheckout_tooltip; ?>"><span class="store_disabled_msg">Warning !</span></i>
                                                        <?php } ?>
                                                        <?php } ?>
                                                    </div>
                                                </td>
                                    <td >
                                    <div class="widget-body uniformjs">
                                        <?php if(isset($supercheckout['option']['logged']['confirm']['fields'][$field['id']]['display'])) { ?>
                                        <input type="hidden" value="0" name="supercheckout[option][logged][confirm][fields][<?php echo $field['id']; ?>][display]" />
                                        <?php if($field['id']=='agree'){ ?>
                                            <?php if($text_agree){ ?>
                                                <?php if(isset($supercheckout['option']['logged']['confirm']['fields'][$field['id']]['display']) && $supercheckout['option']['logged']['confirm']['fields'][$field['id']]['display'] == 1){ ?>
                                                <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][logged][confirm][fields][<?php echo $field['id']; ?>][display]" checked="checked" id="logged_confirm_fields_<?php echo $field['id']; ?>_display"/>
                                                <?php }else{ ?>
                                                <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][logged][confirm][fields][<?php echo $field['id']; ?>][display]" id="logged_confirm_fields_<?php echo $field['id']; ?>_display" />
                                                <?php } ?>
                                             <?php }else{ ?>
                                             <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][logged][confirm][fields][<?php echo $field['id']; ?>][display]" disabled="disabled" id="logged_confirm_fields_<?php echo $field['id']; ?>_display" />
                                             <?php } ?>
                                          <?php }else{ ?>
                                            <?php if(isset($supercheckout['option']['logged']['confirm']['fields'][$field['id']]['display']) && $supercheckout['option']['logged']['confirm']['fields'][$field['id']]['display'] == 1){ ?>
                                                <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][logged][confirm][fields][<?php echo $field['id']; ?>][display]" checked="checked" id="logged_confirm_fields_<?php echo $field['id']; ?>_display"/>
                                                <?php }else{ $show_warning=1; ?>
                                                <input class="checkbox" type="checkbox" value="1" name="supercheckout[option][logged][confirm][fields][<?php echo $field['id']; ?>][display]" id="logged_confirm_fields_<?php echo $field['id']; ?>_display" />
                                                <?php } ?>
                                          <?php } ?>
                                        <label for="logged_confirm_fields_<?php echo $field['id']; ?>_display"><?php echo $settings_display; ?></label>
                                        <?php if(isset($supercheckout['option']['logged']['confirm']['fields'][$field['id']]['require'])) { ?>
                                        <input type="hidden" value="0" name="supercheckout[option][logged][confirm][fields][<?php echo $field['id']; ?>][require]" />
                                        <?php if($supercheckout['option']['logged']['confirm']['fields'][$field['id']]['require'] == 4){ ?>
                                        <input class="checkbox" type="checkbox" value="4" name="supercheckout[option][logged][confirm][fields][<?php echo $field['id']; ?>][require]" checked="checked" id="logged_confirm_fields_<?php echo $field['id']; ?>_require"/>
                                        <?php }else{ ?>
                                        <input class="checkbox" type="checkbox" value="4" name="supercheckout[option][logged][confirm][fields][<?php echo $field['id']; ?>][require]" id="logged_confirm_fields_<?php echo $field['id']; ?>_require" />
                                        <?php } ?>
                                        <label for="logged_confirm_fields_<?php echo $field['id']; ?>_require"><?php echo $settings_require; ?></label>
                                        <?php if($show_warning){ ?>
                                            <i class="store_disabled" data-toggle="tooltip"  data-placement="top" data-original-title="<?php echo $field_disabled_supercheckout_tooltip; ?>"><span class="store_disabled_msg">Warning !</span></i>
                                        <?php } ?>
                                        <?php } ?>
                                        <?php } ?>
                                    </div>
                                </td>
                                </tr>          
                                <?php } /*foreach fields*/?>
                                </tbody>
                                </table>
                            </div>
                        </div>
                        <!-----------------------------------------Design-------------------------------------------->
                        <div id="tab_design_checkout" class="tab-pane">
                            <h3 class="heading-mosaic"><?php echo $supercheckout_text_design; ?></h3>
                            <div class="block">
                                <table class="form">
                                    <?php
                                    if(!isset($_GET['layout'])) {
                                        $_GET['layout'] = '';
                                    }
                                    ?>
                                    <select class="selectpicker col-md-2" name="supercheckout[general][layout]" onChange="$.cookie('designTab',1); locate='<?php echo $route; ?>&layout='+$(this).val(); autosave(locate); ">
                                        <?php $i=0; if(($_GET['layout'] == '1-Column' || $layout=='1-Column') && $i !=0 ){ ?>
                                            <option value="1-Column" selected="selected">1-Column</option>
                                        <?php }else{ ?>
                                            <option value="1-Column">1-Column</option>
                                        <?php } $i++; ?>
                                        <?php if($_GET['layout']=='2-Column' || $layout=='2-Column'){ ?>
                                            <option value="2-Column" selected="selected">2-Column</option>
                                        <?php }else{ ?>
                                            <option value="2-Column">2-Column</option>
                                        <?php } ?>
                                        <?php if($_GET['layout']=='3-Column' || $layout=='3-Column'){ ?>
                                            <option value="3-Column" selected="selected">3-Column</option>
                                        <?php }else{ ?>
                                            <option value="3-Column">3-Column</option>
                                        <?php } ?>
                                        
                                    </select><br/>
                                    <tbody>
                                        <tr>
											<?php foreach($supercheckout['step']['html'] as $k=>$v){ ?>
                                                <input id="two_col_h_<?php echo $k; ?>"  type="hidden"  class="sort col-data" name="supercheckout[step][html][<?php echo $k; ?>][two-column][column]" value="<?php echo $supercheckout['step']['html'][$k]['two-column']['column']; ?>" />
                                                <input id="two_row_h_<?php echo $k; ?>"  type="hidden"  class="sort row-data" name="supercheckout[step][html][<?php echo $k; ?>][two-column][row]" value="<?php echo $supercheckout['step']['html'][$k]['two-column']['row']; ?>" />
                                                <input id="two_col_ins_h_<?php echo $k; ?>"  type="hidden"  class="sort col-data-inside" name="supercheckout[step][html][<?php echo $k; ?>][two-column][column-inside]" value="<?php echo $supercheckout['step']['html'][$k]['two-column']['column-inside']; ?>" />
                                                <?php } ?>
                                                <?php foreach($supercheckout['step']['html'] as $k=>$v){ ?>
                                                <input id="one_col_h_<?php echo $k; ?>"  type="hidden"  class="sort col-data" name="supercheckout[step][html][<?php echo $k; ?>][one-column][column]" value="<?php echo $supercheckout['step']['html'][$k]['one-column']['column']; ?>" />
                                                <input id="one_row_h_<?php echo $k; ?>"  type="hidden"  class="sort row-data" name="supercheckout[step][html][<?php echo $k; ?>][one-column][row]" value="<?php echo $supercheckout['step']['html'][$k]['one-column']['row']; ?>" />
                                                <input id="one_col_ins_h_<?php echo $k; ?>"  type="hidden"  class="sort col-data-inside" name="supercheckout[step][html][<?php echo $k; ?>][one-column][column-inside]" value="<?php echo $supercheckout['step']['html'][$k]['one-column']['column-inside']; ?>" />
                                                <?php } ?>
                                                <?php foreach($supercheckout['step']['html'] as $k=>$v){ ?>
                                                <input id="three_col_h_<?php echo $k; ?>"  type="hidden"  class="sort col-data" name="supercheckout[step][html][<?php echo $k; ?>][three-column][column]" value="<?php echo $supercheckout['step']['html'][$k]['three-column']['column']; ?>" />
                                                <input id="three_row_h_<?php echo $k; ?>"  type="hidden"  class="sort row-data" name="supercheckout[step][html][<?php echo $k; ?>][three-column][row]" value="<?php echo $supercheckout['step']['html'][$k]['three-column']['row']; ?>" />
                                                <input id="three_col_ins_h_<?php echo $k; ?>"  type="hidden"  class="sort col-data-inside" name="supercheckout[step][html][<?php echo $k; ?>][three-column][column-inside]" value="<?php echo $supercheckout['step']['html'][$k]['three-column']['column-inside']; ?>" />
                                                <?php } ?>
                                                <input id="value_modal" type="hidden" name="supercheckout[step][modal_value]" value="<?php echo isset($supercheckout['step']['modal_value'])?$supercheckout['step']['modal_value']:1 ;?>">
                                            <?php if($layout=='3-Column') {  ?>
                                           
                                            <td  colspan="2" style="position:static">
                                                 <input   type="hidden"  class="sort col-data" name="supercheckout[step][payment_address][two-column][column]" value="<?php echo $supercheckout['step']['payment_address']['two-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][payment_address][two-column][row]" value="<?php echo $supercheckout['step']['payment_address']['two-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][payment_address][two-column][column-inside]" value="<?php echo $supercheckout['step']['payment_address']['two-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][login][two-column][column]" value="<?php echo $supercheckout['step']['login']['two-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][login][two-column][row]" value="<?php echo $supercheckout['step']['login']['two-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][login][two-column][column-inside]" value="<?php echo $supercheckout['step']['login']['two-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][shipping_address][two-column][column]" value="<?php echo $supercheckout['step']['shipping_address']['two-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][shipping_address][two-column][row]" value="<?php echo $supercheckout['step']['shipping_address']['two-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][shipping_address][two-column][column-inside]" value="<?php echo $supercheckout['step']['shipping_address']['two-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][shipping_method][two-column][column]" value="<?php echo $supercheckout['step']['shipping_method']['two-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][shipping_method][two-column][row]" value="<?php echo $supercheckout['step']['shipping_method']['two-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][shipping_method][two-column][column-inside]" value="<?php echo $supercheckout['step']['shipping_method']['two-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][payment_method][two-column][column]" value="<?php echo $supercheckout['step']['payment_method']['two-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][payment_method][two-column][row]" value="<?php echo $supercheckout['step']['payment_method']['two-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][payment_method][two-column][column-inside]" value="<?php echo $supercheckout['step']['payment_method']['two-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][cart][two-column][column]" value="<?php echo $supercheckout['step']['cart']['two-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][cart][two-column][row]" value="<?php echo $supercheckout['step']['cart']['two-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][cart][two-column][column-inside]" value="<?php echo $supercheckout['step']['cart']['two-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][confirm][two-column][column]" value="<?php echo $supercheckout['step']['confirm']['two-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][confirm][two-column][row]" value="<?php echo $supercheckout['step']['confirm']['two-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][confirm][two-column][column-inside]" value="<?php echo $supercheckout['step']['confirm']['two-column']['column-inside']; ?>" />
                                                
                                                
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][payment_address][one-column][column]" value="<?php echo $supercheckout['step']['payment_address']['one-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][payment_address][one-column][row]" value="<?php echo $supercheckout['step']['payment_address']['one-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][payment_address][one-column][column-inside]" value="<?php echo $supercheckout['step']['payment_address']['one-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][login][one-column][column]" value="<?php echo $supercheckout['step']['login']['one-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][login][one-column][row]" value="<?php echo $supercheckout['step']['login']['one-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][login][one-column][column-inside]" value="<?php echo $supercheckout['step']['login']['one-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][shipping_address][one-column][column]" value="<?php echo $supercheckout['step']['shipping_address']['one-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][shipping_address][one-column][row]" value="<?php echo $supercheckout['step']['shipping_address']['one-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][shipping_address][one-column][column-inside]" value="<?php echo $supercheckout['step']['shipping_address']['one-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][shipping_method][one-column][column]" value="<?php echo $supercheckout['step']['shipping_method']['one-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][shipping_method][one-column][row]" value="<?php echo $supercheckout['step']['shipping_method']['one-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][shipping_method][one-column][column-inside]" value="<?php echo $supercheckout['step']['shipping_method']['one-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][payment_method][one-column][column]" value="<?php echo $supercheckout['step']['payment_method']['one-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][payment_method][one-column][row]" value="<?php echo $supercheckout['step']['payment_method']['one-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][payment_method][one-column][column-inside]" value="<?php echo $supercheckout['step']['payment_method']['one-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][cart][one-column][column]" value="<?php echo $supercheckout['step']['cart']['one-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][cart][one-column][row]" value="<?php echo $supercheckout['step']['cart']['one-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][cart][one-column][column-inside]" value="<?php echo $supercheckout['step']['cart']['one-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][confirm][one-column][column]" value="<?php echo $supercheckout['step']['confirm']['one-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][confirm][one-column][row]" value="<?php echo $supercheckout['step']['confirm']['one-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][confirm][one-column][column-inside]" value="<?php echo $supercheckout['step']['confirm']['one-column']['column-inside']; ?>" />
                                                
                                                
                                                 <input   type="hidden"  class="sort col-data" name="supercheckout[step][payment_address][three-column][column]" value="<?php echo $supercheckout['step']['payment_address']['three-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][payment_address][three-column][row]" value="<?php echo $supercheckout['step']['payment_address']['three-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][payment_address][three-column][column-inside]" value="<?php echo $supercheckout['step']['payment_address']['three-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][login][three-column][column]" value="<?php echo $supercheckout['step']['login']['three-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][login][three-column][row]" value="<?php echo $supercheckout['step']['login']['three-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][login][three-column][column-inside]" value="<?php echo $supercheckout['step']['login']['three-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][shipping_address][three-column][column]" value="<?php echo $supercheckout['step']['shipping_address']['three-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][shipping_address][three-column][row]" value="<?php echo $supercheckout['step']['shipping_address']['three-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][shipping_address][three-column][column-inside]" value="<?php echo $supercheckout['step']['shipping_address']['three-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][shipping_method][three-column][column]" value="<?php echo $supercheckout['step']['shipping_method']['three-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][shipping_method][three-column][row]" value="<?php echo $supercheckout['step']['shipping_method']['three-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][shipping_method][three-column][column-inside]" value="<?php echo $supercheckout['step']['shipping_method']['three-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][payment_method][three-column][column]" value="<?php echo $supercheckout['step']['payment_method']['three-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][payment_method][three-column][row]" value="<?php echo $supercheckout['step']['payment_method']['three-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][payment_method][three-column][column-inside]" value="<?php echo $supercheckout['step']['payment_method']['three-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][cart][three-column][column]" value="<?php echo $supercheckout['step']['cart']['three-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][cart][three-column][row]" value="<?php echo $supercheckout['step']['cart']['three-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][cart][three-column][column-inside]" value="<?php echo $supercheckout['step']['cart']['three-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][confirm][three-column][column]" value="<?php echo $supercheckout['step']['confirm']['three-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][confirm][three-column][row]" value="<?php echo $supercheckout['step']['confirm']['three-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][confirm][three-column][column-inside]" value="<?php echo $supercheckout['step']['confirm']['three-column']['column-inside']; ?>" />
                                                
                                                
                                                
                                            <!-- author: mohit kochhar-->
                                            <input type="hidden"  class="column-data-3 col" name="supercheckout[general][column_width][three-column][inside][1]" value="<?php echo $supercheckout['general']['column_width']['three-column']['inside'][1]; ?>" />
                                            <input type="hidden"  class="column-data-3 col" name="supercheckout[general][column_width][three-column][inside][2]" value="<?php echo $supercheckout['general']['column_width']['three-column']['inside'][2]; ?>" />
                                            
                                            <input type="hidden"  class="column-data-1 col" name="supercheckout[general][column_width][two-column][1]" value="<?php echo $supercheckout['general']['column_width']['two-column'][1]; ?>" />
                                            <input type="hidden"  class="column-data-2 col" name="supercheckout[general][column_width][two-column][2]" value="<?php echo $supercheckout['general']['column_width']['two-column'][2]; ?>" />
                                            <input type="hidden"  class="column-data-2 col" name="supercheckout[general][column_width][two-column][3]" value="<?php echo $supercheckout['general']['column_width']['two-column'][3]; ?>" />
                                            <input type="hidden"  class="column-data-3 col" name="supercheckout[general][column_width][two-column][inside][1]" value="<?php echo $supercheckout['general']['column_width']['two-column']['inside'][1]; ?>" />
                                            <input type="hidden"  class="column-data-3 col" name="supercheckout[general][column_width][two-column][inside][2]" value="<?php echo $supercheckout['general']['column_width']['two-column']['inside'][2]; ?>" />
                                            
                                            <input type="hidden"  class="column-data-1 col" name="supercheckout[general][column_width][one-column][1]" value="<?php echo $supercheckout['general']['column_width']['one-column'][1]; ?>" />
                                            <input type="hidden"  class="column-data-2 col" name="supercheckout[general][column_width][one-column][2]" value="<?php echo $supercheckout['general']['column_width']['one-column'][2]; ?>" />
                                            <input type="hidden"  class="column-data-2 col" name="supercheckout[general][column_width][one-column][3]" value="<?php echo $supercheckout['general']['column_width']['one-column'][3]; ?>" />
                                            <input type="hidden"  class="column-data-3 col" name="supercheckout[general][column_width][one-column][inside][1]" value="<?php echo $supercheckout['general']['column_width']['one-column']['inside'][1]; ?>" />
                                            <input type="hidden"  class="column-data-3 col" name="supercheckout[general][column_width][one-column][inside][2]" value="<?php echo $supercheckout['general']['column_width']['one-column']['inside'][2]; ?>" />
                                            
                                            
                                            
                                            
                                            
                
                                            
                                            
                                            
                                            <!-- author: mohit kochhar-->
                                                <input   type="text"  class="sort row-data" name="supercheckout[step][payment_address][one-column][row]" value="<?php echo $supercheckout['step']['payment_address']['one-column']['row']; ?>" />
                                                <input   type="text"  class="sort row-data" name="supercheckout[step][login][one-column][row]" value="<?php echo $supercheckout['step']['login']['one-column']['row']; ?>" />
                                                <input   type="text"  class="sort row-data" name="supercheckout[step][shipping_address][one-column][row]" value="<?php echo $supercheckout['step']['shipping_address']['one-column']['row']; ?>" />
                                                <input   type="text"  class="sort row-data" name="supercheckout[step][shipping_method][one-column][row]" value="<?php echo $supercheckout['step']['shipping_method']['one-column']['row']; ?>" />
                                                <input   type="text"  class="sort row-data" name="supercheckout[step][payment_method][one-column][row]" value="<?php echo $supercheckout['step']['payment_method']['one-column']['row']; ?>" />
                                                <input   type="text"  class="sort row-data" name="supercheckout[step][cart][one-column][row]" value="<?php echo $supercheckout['step']['cart']['one-column']['row']; ?>" />
                                                <input   type="text"  class="sort row-data" name="supercheckout[step][confirm][one-column][row]" value="<?php echo $supercheckout['step']['confirm']['one-column']['row']; ?>" />
                                                
                                               <div class="portlet" style="display:none">
                                                        <div class="portlet-header"><?php echo $supercheckout_text_html_header; ?></div>
                                                        <div class="portlet-content">
                                                            <div class="text" style="overflow:visible !important;" >
<!--                                                            <a id="duplicate_button" data="1" class="glyphicons more_windows" onClick="duplicate_html(this.id);" ><i></i></a>-->
                                                            
                                                            <a data-toggle="tooltip"  data-placement="top" data-original-title="Edit this HTML content" id="modals-bootbox-prompt_header" data-toggle="modal" class="glyphicons edit" ><i></i></a>
                                                            </div>
                                                        </div>
                                                </div>
                                                <div class="columns">
                                                    <input type="text" id="three-column-1" readonly="readonly" class="column-data-1 col" name="supercheckout[general][column_width][three-column][1]" value="<?php echo $supercheckout['general']['column_width']['three-column'][1]; ?>" />
                                                    <input type="text" id="three-column-2" readonly="readonly" class="column-data-2 col" name="supercheckout[general][column_width][three-column][2]" value="<?php echo $supercheckout['general']['column_width']['three-column'][2]; ?>" />
                                                    <input type="text" id="three-column-3" readonly="readonly" class="column-data-3 col" name="supercheckout[general][column_width][three-column][3]" value="<?php echo $supercheckout['general']['column_width']['three-column'][3]; ?>" />
                                                </div>
                                               
                                                <div id="slider" class="ui-editRangeSlider"></div>
                                                
                                                <ul id="column_1" class="column column-1" col-data="1">
                                                    <li class="portlet" col-data="<?php echo $supercheckout['step']['payment_address']['three-column']['column']; ?>" row-data="<?php echo $supercheckout['step']['payment_address']['three-column']['row']; ?>">
                                                        <div class="portlet-header"><i class="icon-small-payment-address"></i><?php echo $supercheckout_text_payment_address; ?></div>
                                                        <div class="portlet-content">
                                                            <div class="text"><?php echo $supercheckout_text_payment_address_description; ?></div>
                                                            <div class="text"><i class="icon-drag"></i><i class="icon-drag"></i></div>
                                                            <input   type="text"  class="sort col-data" name="supercheckout[step][payment_address][three-column][column]" value="<?php echo $supercheckout['step']['payment_address']['three-column']['column']; ?>" />
                                                            <input   type="text"  class="sort row-data" name="supercheckout[step][payment_address][three-column][row]" value="<?php echo $supercheckout['step']['payment_address']['three-column']['row']; ?>" />
                                                        </div>
                                                    </li>
                                                    <li class="portlet" col-data="<?php echo $supercheckout['step']['login']['three-column']['column']; ?>" row-data="<?php echo $supercheckout['step']['login']['three-column']['row']; ?>">
                                                        <div class="portlet-header"><i class="icon-small-payment-address"></i><?php echo $supercheckout_text_login; ?></div>
                                                        <div class="portlet-content">
                                                            <div class="text"><?php echo $supercheckout_text_payment_address_description; ?></div>
                                                            <div class="text"><i class="icon-drag"></i><i class="icon-drag"></i></div>
                                                            <input   type="text"  class="sort col-data" name="supercheckout[step][login][three-column][column]" value="<?php echo $supercheckout['step']['login']['three-column']['column']; ?>" />
                                                            <input   type="text"  class="sort row-data" name="supercheckout[step][login][three-column][row]" value="<?php echo $supercheckout['step']['login']['three-column']['row']; ?>" />
                                                        </div>
                                                    </li>
                                                    <li class="portlet" col-data="<?php echo $supercheckout['step']['shipping_address']['three-column']['column']; ?>" row-data="<?php echo $supercheckout['step']['shipping_address']['three-column']['row']; ?>">
                                                        <div class="portlet-header"><i class="icon-small-shipping-address"></i><?php echo $supercheckout_text_shipping_address; ?></div>
                                                        <div class="portlet-content">
                                                            <div class="text"><?php echo $supercheckout_text_shipping_address_description; ?></div>
                                                            <div class="text"><i class="icon-drag"></i><i class="icon-drag"></i></div>
                                                            <input   type="text"  class="sort col-data" name="supercheckout[step][shipping_address][three-column][column]" value="<?php echo $supercheckout['step']['shipping_address']['three-column']['column']; ?>" />
                                                            <input   type="text"  class="sort row-data" name="supercheckout[step][shipping_address][three-column][row]" value="<?php echo $supercheckout['step']['shipping_address']['three-column']['row']; ?>" />
                                                        </div>
                                                    </li>
                                                    <li class="portlet" col-data="<?php echo $supercheckout['step']['shipping_method']['three-column']['column']; ?>" row-data="<?php echo $supercheckout['step']['shipping_method']['three-column']['row']; ?>">
                                                        <div class="portlet-header"><i class="icon-small-shipping-method"></i><?php echo $supercheckout_text_shipping_method; ?></div>
                                                        <div class="portlet-content">
                                                            <div class="text"><?php echo $supercheckout_text_shipping_method_description; ?></div>
                                                            <div class="text"><i class="icon-drag"></i><i class="icon-drag"></i></div>
                                                            <input   type="text"  class="sort col-data" name="supercheckout[step][shipping_method][three-column][column]" value="<?php echo $supercheckout['step']['shipping_method']['three-column']['column']; ?>" />
                                                            <input   type="text"  class="sort row-data" name="supercheckout[step][shipping_method][three-column][row]" value="<?php echo $supercheckout['step']['shipping_method']['three-column']['row']; ?>" />
                                                        </div>
                                                    </li>
                                                    <li class="portlet" col-data="<?php echo $supercheckout['step']['payment_method']['three-column']['column']; ?>" row-data="<?php echo $supercheckout['step']['payment_method']['three-column']['row']; ?>">
                                                        <div class="portlet-header"><i class="icon-small-payment-method"></i><?php echo $supercheckout_text_payment_method; ?></div>
                                                        <div class="portlet-content">
                                                            <div class="text"><?php echo $supercheckout_text_payment_method_description; ?></div>
                                                            <div class="text"><i class="icon-drag"></i><i class="icon-drag"></i></div>
                                                            <input   type="text"  class="sort col-data" name="supercheckout[step][payment_method][three-column][column]" value="<?php echo $supercheckout['step']['payment_method']['three-column']['column']; ?>" />
                                                            <input   type="text"  class="sort row-data" name="supercheckout[step][payment_method][three-column][row]" value="<?php echo $supercheckout['step']['payment_method']['three-column']['row']; ?>" />
                                                        </div>
                                                    </li>
                                                    <li class="portlet" col-data="<?php echo $supercheckout['step']['cart']['three-column']['column']; ?>" row-data="<?php echo $supercheckout['step']['cart']['three-column']['row']; ?>">
                                                        <div class="portlet-header"><i class="icon-small-confirm"></i><?php echo $supercheckout_text_cart; ?></div>
                                                        <div class="portlet-content">
                                                            <div class="text"><?php echo $supercheckout_text_cart_description; ?></div>
                                                            <div class="text"><i class="icon-drag"></i><i class="icon-drag"></i></div>
                                                            <input   type="text"  class="sort col-data" name="supercheckout[step][cart][three-column][column]" value="<?php echo $supercheckout['step']['cart']['three-column']['column']; ?>" />
                                                            <input   type="text"  class="sort row-data" name="supercheckout[step][cart][three-column][row]" value="<?php echo $supercheckout['step']['cart']['three-column']['row']; ?>" />
                                                        </div>
                                                    </li>
                                                    <li class="portlet" col-data="<?php echo $supercheckout['step']['confirm']['three-column']['column']; ?>" row-data="<?php echo $supercheckout['step']['confirm']['three-column']['row']; ?>">
                                                        <div class="portlet-header"><i class="icon-small-confirm"></i><?php echo $supercheckout_text_confirm; ?></div>
                                                        <div class="portlet-content">
                                                            <div class="text"><?php echo $supercheckout_text_confirm_description; ?></div>
                                                            <div class="text"><i class="icon-drag"></i><i class="icon-drag"></i></div>
                                                            <input   type="text"  class="sort col-data" name="supercheckout[step][confirm][three-column][column]" value="<?php echo $supercheckout['step']['confirm']['three-column']['column']; ?>" />
                                                            <input   type="text"  class="sort row-data" name="supercheckout[step][confirm][three-column][row]" value="<?php echo $supercheckout['step']['confirm']['three-column']['row']; ?>" />
                                                        </div>
                                                    </li>

													
                                                  <?php foreach($supercheckout['step']['html'] as $k=>$v){  ?>
                                                    <li class="portlet" style="display:none" id="portlet_<?php echo $k; ?>" col-data="<?php echo $supercheckout['step']['html'][$k]['three-column']['column']; ?>" row-data="<?php echo $supercheckout['step']['html'][$k]['three-column']['row']; ?>">
                                                        <div class="portlet-header"><?php echo $supercheckout_text_html; ?></div>
                                                        <div class="portlet-content" id="portlet_content_<?php echo $k; ?>">
                                                            <div class="text" style="overflow:visible !important;" >
                                                            <a data-toggle="tooltip"  data-placement="top" data-original-title=" Add new HTML content" id="duplicate_button_<?php echo $k; ?>" data="0" class="glyphicons more_windows"  onClick="duplicate_html(this.id);" ><i></i></a>
                                                            
                                                            <a data-toggle="tooltip"  data-placement="top" data-original-title="Edit this HTML content" id="modals-bootbox-prompt_<?php echo $k; ?>" data-toggle="modal" class="glyphicons edit" ><i></i></a>
                                                            <?php if($k !="0_0"){ ?>
                                                            <a data-toggle="tooltip"  data-placement="top" data-original-title="Remove this HTML content" id="delete_button_<?php echo $k; ?>" data="<?php echo $k; ?>" data-toggle="modal" class="glyphicons remove"  onClick="remove_html(this.id);" ><i></i></a>
                                                            <?php } ?>
                                                            </div>
                                                            
                                                            <input id="col_text_<?php echo $k; ?>"   type="text"  class="sort col-data" name="supercheckout[step][html][<?php echo $k; ?>][three-column][column]" value="<?php echo $supercheckout['step']['html'][$k]['three-column']['column']; ?>" />
                                                            <input id="row_text_<?php echo $k; ?>"  type="text"  class="sort row-data" name="supercheckout[step][html][<?php echo $k; ?>][three-column][row]" value="<?php echo $supercheckout['step']['html'][$k]['three-column']['row']; ?>" />
                                                        </div>
                                                    </li>                                                    
                                                    <?php } ?>
                                                </ul>
                                                <ul id="column_2" class="column column-2" col-data="2">
                                                </ul>
                                                <ul id="column_3" class="column column-3" col-data="3">
                                                </ul>
                                                <div class="portlet" style="display:none">
                                                        <div class="portlet-header"><?php echo $supercheckout_text_html_footer; ?></div>
                                                        <div class="portlet-content">
                                                            <div class="text" style="overflow:visible !important;" >
                                                            
                                                            <a data-toggle="tooltip"  data-placement="top" data-original-title="Edit this HTML content" id="modals-bootbox-prompt_footer" data-toggle="modal" class="glyphicons edit" ><i></i></a>
                                                            </div>
                                                        </div>
                                                </div>
                                                <br style="clear:both">
                                            </td>
                                            <?php } else if($layout=='2-Column') { ?>
                                                <td  colspan="2" style="position:static">
                                                  <input   type="hidden"  class="sort col-data" name="supercheckout[step][payment_address][two-column][column]" value="<?php echo $supercheckout['step']['payment_address']['two-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][payment_address][two-column][row]" value="<?php echo $supercheckout['step']['payment_address']['two-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][payment_address][two-column][column-inside]" value="<?php echo $supercheckout['step']['payment_address']['two-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][login][two-column][column]" value="<?php echo $supercheckout['step']['login']['two-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][login][two-column][row]" value="<?php echo $supercheckout['step']['login']['two-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][login][two-column][column-inside]" value="<?php echo $supercheckout['step']['login']['two-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][shipping_address][two-column][column]" value="<?php echo $supercheckout['step']['shipping_address']['two-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][shipping_address][two-column][row]" value="<?php echo $supercheckout['step']['shipping_address']['two-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][shipping_address][two-column][column-inside]" value="<?php echo $supercheckout['step']['shipping_address']['two-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][shipping_method][two-column][column]" value="<?php echo $supercheckout['step']['shipping_method']['two-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][shipping_method][two-column][row]" value="<?php echo $supercheckout['step']['shipping_method']['two-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][shipping_method][two-column][column-inside]" value="<?php echo $supercheckout['step']['shipping_method']['two-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][payment_method][two-column][column]" value="<?php echo $supercheckout['step']['payment_method']['two-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][payment_method][two-column][row]" value="<?php echo $supercheckout['step']['payment_method']['two-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][payment_method][two-column][column-inside]" value="<?php echo $supercheckout['step']['payment_method']['two-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][cart][two-column][column]" value="<?php echo $supercheckout['step']['cart']['two-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][cart][two-column][row]" value="<?php echo $supercheckout['step']['cart']['two-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][cart][two-column][column-inside]" value="<?php echo $supercheckout['step']['cart']['two-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][confirm][two-column][column]" value="<?php echo $supercheckout['step']['confirm']['two-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][confirm][two-column][row]" value="<?php echo $supercheckout['step']['confirm']['two-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][confirm][two-column][column-inside]" value="<?php echo $supercheckout['step']['confirm']['two-column']['column-inside']; ?>" />

                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][payment_address][one-column][column]" value="<?php echo $supercheckout['step']['payment_address']['one-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][payment_address][one-column][row]" value="<?php echo $supercheckout['step']['payment_address']['one-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][payment_address][one-column][column-inside]" value="<?php echo $supercheckout['step']['payment_address']['one-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][login][one-column][column]" value="<?php echo $supercheckout['step']['login']['one-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][login][one-column][row]" value="<?php echo $supercheckout['step']['login']['one-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][login][one-column][column-inside]" value="<?php echo $supercheckout['step']['login']['one-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][shipping_address][one-column][column]" value="<?php echo $supercheckout['step']['shipping_address']['one-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][shipping_address][one-column][row]" value="<?php echo $supercheckout['step']['shipping_address']['one-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][shipping_address][one-column][column-inside]" value="<?php echo $supercheckout['step']['shipping_address']['one-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][shipping_method][one-column][column]" value="<?php echo $supercheckout['step']['shipping_method']['one-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][shipping_method][one-column][row]" value="<?php echo $supercheckout['step']['shipping_method']['one-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][shipping_method][one-column][column-inside]" value="<?php echo $supercheckout['step']['shipping_method']['one-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][payment_method][one-column][column]" value="<?php echo $supercheckout['step']['payment_method']['one-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][payment_method][one-column][row]" value="<?php echo $supercheckout['step']['payment_method']['one-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][payment_method][one-column][column-inside]" value="<?php echo $supercheckout['step']['payment_method']['one-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][cart][one-column][column]" value="<?php echo $supercheckout['step']['cart']['one-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][cart][one-column][row]" value="<?php echo $supercheckout['step']['cart']['one-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][cart][one-column][column-inside]" value="<?php echo $supercheckout['step']['cart']['one-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][confirm][one-column][column]" value="<?php echo $supercheckout['step']['confirm']['one-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][confirm][one-column][row]" value="<?php echo $supercheckout['step']['confirm']['one-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][confirm][one-column][column-inside]" value="<?php echo $supercheckout['step']['confirm']['one-column']['column-inside']; ?>" />
                                                
                                                
                                                
                                                 <input   type="hidden"  class="sort col-data" name="supercheckout[step][payment_address][three-column][column]" value="<?php echo $supercheckout['step']['payment_address']['three-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][payment_address][three-column][row]" value="<?php echo $supercheckout['step']['payment_address']['three-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][payment_address][three-column][column-inside]" value="<?php echo $supercheckout['step']['payment_address']['three-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][login][three-column][column]" value="<?php echo $supercheckout['step']['login']['three-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][login][three-column][row]" value="<?php echo $supercheckout['step']['login']['three-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][login][three-column][column-inside]" value="<?php echo $supercheckout['step']['login']['three-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][shipping_address][three-column][column]" value="<?php echo $supercheckout['step']['shipping_address']['three-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][shipping_address][three-column][row]" value="<?php echo $supercheckout['step']['shipping_address']['three-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][shipping_address][three-column][column-inside]" value="<?php echo $supercheckout['step']['shipping_address']['three-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][shipping_method][three-column][column]" value="<?php echo $supercheckout['step']['shipping_method']['three-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][shipping_method][three-column][row]" value="<?php echo $supercheckout['step']['shipping_method']['three-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][shipping_method][three-column][column-inside]" value="<?php echo $supercheckout['step']['shipping_method']['three-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][payment_method][three-column][column]" value="<?php echo $supercheckout['step']['payment_method']['three-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][payment_method][three-column][row]" value="<?php echo $supercheckout['step']['payment_method']['three-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][payment_method][three-column][column-inside]" value="<?php echo $supercheckout['step']['payment_method']['three-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][cart][three-column][column]" value="<?php echo $supercheckout['step']['cart']['three-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][cart][three-column][row]" value="<?php echo $supercheckout['step']['cart']['three-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][cart][three-column][column-inside]" value="<?php echo $supercheckout['step']['cart']['three-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][confirm][three-column][column]" value="<?php echo $supercheckout['step']['confirm']['three-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][confirm][three-column][row]" value="<?php echo $supercheckout['step']['confirm']['three-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][confirm][three-column][column-inside]" value="<?php echo $supercheckout['step']['confirm']['three-column']['column-inside']; ?>" />
                                                
                                                
                                                <!--                                               one- column- part-->
                                                <input   type="text"  class="sort row-data" name="supercheckout[step][payment_address][one-column][row]" value="<?php echo $supercheckout['step']['payment_address']['one-column']['row']; ?>" />
                                                <input   type="text"  class="sort row-data" name="supercheckout[step][login][one-column][row]" value="<?php echo $supercheckout['step']['login']['one-column']['row']; ?>" />
                                                <input   type="text"  class="sort row-data" name="supercheckout[step][shipping_address][one-column][row]" value="<?php echo $supercheckout['step']['shipping_address']['one-column']['row']; ?>" />
                                                <input   type="text"  class="sort row-data" name="supercheckout[step][shipping_method][one-column][row]" value="<?php echo $supercheckout['step']['shipping_method']['one-column']['row']; ?>" />
                                                <input   type="text"  class="sort row-data" name="supercheckout[step][payment_method][one-column][row]" value="<?php echo $supercheckout['step']['payment_method']['one-column']['row']; ?>" />
                                                <input   type="text"  class="sort row-data" name="supercheckout[step][cart][one-column][row]" value="<?php echo $supercheckout['step']['cart']['one-column']['row']; ?>" />
                                                <input   type="text"  class="sort row-data" name="supercheckout[step][confirm][one-column][row]" value="<?php echo $supercheckout['step']['confirm']['one-column']['row']; ?>" />
												<div class="portlet" style="display:none">
                                                        <div class="portlet-header"><?php echo $supercheckout_text_html_header; ?></div>
                                                        <div class="portlet-content">
                                                            <div class="text" style="overflow:visible !important;" >
                                                            
                                                            <a data-toggle="tooltip"  data-placement="top" data-original-title="Edit this HTML content" id="modals-bootbox-prompt_header" data-toggle="modal" class="glyphicons edit" ><i></i></a>
                                                            </div>
                                                        </div>
                                                </div>
                                                
                                                <div class="columns">
                                            <input type="hidden"  class="column-data-1 col" name="supercheckout[general][column_width][three-column][1]" value="<?php echo $supercheckout['general']['column_width']['three-column'][1]; ?>" />
                                            <input type="hidden"  class="column-data-2 col" name="supercheckout[general][column_width][three-column][2]" value="<?php echo $supercheckout['general']['column_width']['three-column'][2]; ?>" />
                                            <input type="hidden"  class="column-data-2 col" name="supercheckout[general][column_width][three-column][3]" value="<?php echo $supercheckout['general']['column_width']['three-column'][3]; ?>" />
                                            <input type="hidden"  class="column-data-3 col" name="supercheckout[general][column_width][three-column][inside][1]" value="<?php echo $supercheckout['general']['column_width']['three-column']['inside'][1]; ?>" />
                                            <input type="hidden"  class="column-data-3 col" name="supercheckout[general][column_width][three-column][inside][2]" value="<?php echo $supercheckout['general']['column_width']['three-column']['inside'][2]; ?>" />
                                            
                                            <input type="hidden"  class="column-data-1 col" name="supercheckout[general][column_width][one-column][1]" value="<?php echo $supercheckout['general']['column_width']['one-column'][1]; ?>" />
                                            <input type="hidden"  class="column-data-2 col" name="supercheckout[general][column_width][one-column][2]" value="<?php echo $supercheckout['general']['column_width']['one-column'][2]; ?>" />
                                            <input type="hidden"  class="column-data-2 col" name="supercheckout[general][column_width][one-column][3]" value="<?php echo $supercheckout['general']['column_width']['one-column'][3]; ?>" />
                                            <input type="hidden"  class="column-data-3 col" name="supercheckout[general][column_width][one-column][inside][1]" value="<?php echo $supercheckout['general']['column_width']['one-column']['inside'][1]; ?>" />
                                            <input type="hidden"  class="column-data-3 col" name="supercheckout[general][column_width][one-column][inside][2]" value="<?php echo $supercheckout['general']['column_width']['one-column']['inside'][2]; ?>" />
                                            <input type="hidden"  class="column-data-2 col" name="supercheckout[general][column_width][two-column][3]" value="<?php echo $supercheckout['general']['column_width']['two-column'][3]; ?>" />
                                            
                                           
                                            
                                                    <input type="text" id="column-1-text"  class="column-data-1 col" name="supercheckout[general][column_width][two-column][1]" value="<?php echo $supercheckout['general']['column_width']['two-column'][1]; ?>" />
                                                    <input type="text" id="column-2-text" class="column-data-2 col" name="supercheckout[general][column_width][two-column][2]" value="<?php echo $supercheckout['general']['column_width']['two-column'][2]; ?>" />
                                                </div>
                                                <div id="slider" class="ui-editRangeSlider"></div>
                                                
                                                <ul id="column-1" class="column column-1" col-data="1" col-inside-data="1">
                                                    <li class="portlet" col-data="<?php echo $supercheckout['step']['payment_address']['two-column']['column']; ?>" row-data="<?php echo $supercheckout['step']['payment_address']['two-column']['row']; ?>" col-inside-data="<?php echo $supercheckout['step']['payment_address']['two-column']['column-inside']; ?>">
                                                        <div class="portlet-header"><i class="icon-small-payment-address"></i><?php echo $supercheckout_text_payment_address; ?></div>
                                                        <div class="portlet-content">
                                                            <div class="text"><?php echo $supercheckout_text_payment_address_description; ?></div>
                                                            <div class="text"><i class="icon-drag"></i><i class="icon-drag"></i></div>
                                                            <input   type="text"  class="sort col-data" name="supercheckout[step][payment_address][two-column][column]" value="<?php echo $supercheckout['step']['payment_address']['two-column']['column']; ?>" />
                                                            <input   type="text"  class="sort row-data" name="supercheckout[step][payment_address][two-column][row]" value="<?php echo $supercheckout['step']['payment_address']['two-column']['row']; ?>" />
                                                            <input   type="text"  class="sort col-data-inside" name="supercheckout[step][payment_address][two-column][column-inside]" value="<?php echo $supercheckout['step']['payment_address']['two-column']['column-inside']; ?>" />
                                                        </div>
                                                    </li>
                                                    <li class="portlet" col-data="<?php echo $supercheckout['step']['login']['two-column']['column']; ?>" row-data="<?php echo $supercheckout['step']['login']['two-column']['row']; ?>" col-inside-data="<?php echo $supercheckout['step']['login']['two-column']['column-inside']; ?>">
                                                        <div class="portlet-header"><i class="icon-small-payment-address"></i><?php echo $supercheckout_text_login; ?></div>
                                                        <div class="portlet-content">
                                                            <div class="text"><?php echo $supercheckout_text_payment_address_description; ?></div>
                                                            <div class="text"><i class="icon-drag"></i><i class="icon-drag"></i></div>
                                                            <input   type="text"  class="sort col-data" name="supercheckout[step][login][two-column][column]" value="<?php echo $supercheckout['step']['login']['two-column']['column']; ?>" />
                                                            <input   type="text"  class="sort row-data" name="supercheckout[step][login][two-column][row]" value="<?php echo $supercheckout['step']['login']['two-column']['row']; ?>" />
                                                            <input   type="text"  class="sort col-data-inside" name="supercheckout[step][login][two-column][column-inside]" value="<?php echo $supercheckout['step']['login']['two-column']['column-inside']; ?>" />
                                                        </div>
                                                    </li>
                                                    <li class="portlet" col-data="<?php echo $supercheckout['step']['shipping_address']['two-column']['column']; ?>" row-data="<?php echo $supercheckout['step']['shipping_address']['two-column']['row']; ?>" col-inside-data="<?php echo $supercheckout['step']['shipping_address']['two-column']['column-inside']; ?>">
                                                        <div class="portlet-header"><i class="icon-small-shipping-address"></i><?php echo $supercheckout_text_shipping_address; ?></div>
                                                        <div class="portlet-content">
                                                            <div class="text"><?php echo $supercheckout_text_shipping_address_description; ?></div>
                                                            <div class="text"><i class="icon-drag"></i><i class="icon-drag"></i></div>
                                                            <input   type="text"  class="sort col-data" name="supercheckout[step][shipping_address][two-column][column]" value="<?php echo $supercheckout['step']['shipping_address']['two-column']['column']; ?>" />
                                                            <input   type="text"  class="sort row-data" name="supercheckout[step][shipping_address][two-column][row]" value="<?php echo $supercheckout['step']['shipping_address']['two-column']['row']; ?>" />
                                                            <input   type="text"  class="sort col-data-inside" name="supercheckout[step][shipping_address][two-column][column-inside]" value="<?php echo $supercheckout['step']['shipping_address']['two-column']['column-inside']; ?>" />
                                                        </div>
                                                    </li>
                                                    <li class="portlet" col-data="<?php echo $supercheckout['step']['shipping_method']['two-column']['column']; ?>" row-data="<?php echo $supercheckout['step']['shipping_method']['two-column']['row']; ?>"col-inside-data="<?php echo $supercheckout['step']['shipping_method']['two-column']['column-inside']; ?>">
                                                        <div class="portlet-header"><i class="icon-small-shipping-method"></i><?php echo $supercheckout_text_shipping_method; ?></div>
                                                        <div class="portlet-content">
                                                            <div class="text"><?php echo $supercheckout_text_shipping_method_description; ?></div>
                                                            <div class="text"><i class="icon-drag"></i><i class="icon-drag"></i></div>
                                                            <input   type="text"  class="sort col-data" name="supercheckout[step][shipping_method][two-column][column]" value="<?php echo $supercheckout['step']['shipping_method']['two-column']['column']; ?>" />
                                                            <input   type="text"  class="sort row-data" name="supercheckout[step][shipping_method][two-column][row]" value="<?php echo $supercheckout['step']['shipping_method']['two-column']['row']; ?>" />
                                                            <input   type="text"  class="sort col-data-inside" name="supercheckout[step][shipping_method][two-column][column-inside]" value="<?php echo $supercheckout['step']['shipping_method']['two-column']['column-inside']; ?>" />
                                                        </div>
                                                    </li>
                                                    <li class="portlet" col-data="<?php echo $supercheckout['step']['payment_method']['two-column']['column']; ?>" row-data="<?php echo $supercheckout['step']['payment_method']['two-column']['row']; ?>" col-inside-data="<?php echo $supercheckout['step']['payment_method']['two-column']['column-inside']; ?>">
                                                        <div class="portlet-header"><i class="icon-small-payment-method"></i><?php echo $supercheckout_text_payment_method; ?></div>
                                                        <div class="portlet-content">
                                                            <div class="text"><?php echo $supercheckout_text_payment_method_description; ?></div>
                                                            <div class="text"><i class="icon-drag"></i><i class="icon-drag"></i></div>
                                                            <input   type="text"  class="sort col-data" name="supercheckout[step][payment_method][two-column][column]" value="<?php echo $supercheckout['step']['payment_method']['two-column']['column']; ?>" />
                                                            <input   type="text"  class="sort row-data" name="supercheckout[step][payment_method][two-column][row]" value="<?php echo $supercheckout['step']['payment_method']['two-column']['row']; ?>" />
                                                            <input   type="text"  class="sort col-data-inside" name="supercheckout[step][payment_method][two-column][column-inside]" value="<?php echo $supercheckout['step']['payment_method']['two-column']['column-inside']; ?>" />
                                                        </div>
                                                    </li>
                                                    <li class="portlet" col-data="<?php echo $supercheckout['step']['cart']['two-column']['column']; ?>" row-data="<?php echo $supercheckout['step']['cart']['two-column']['row']; ?>" col-inside-data="<?php echo $supercheckout['step']['cart']['two-column']['column-inside']; ?>">
                                                        <div class="portlet-header"><i class="icon-small-confirm"></i><?php echo $supercheckout_text_cart; ?></div>
                                                        <div class="portlet-content">
                                                            <div class="text"><?php echo $supercheckout_text_cart_description; ?></div>
                                                            <div class="text"><i class="icon-drag"></i><i class="icon-drag"></i></div>
                                                            <input   type="text"  class="sort col-data" name="supercheckout[step][cart][two-column][column]" value="<?php echo $supercheckout['step']['cart']['two-column']['column']; ?>" />
                                                            <input   type="text"  class="sort row-data" name="supercheckout[step][cart][two-column][row]" value="<?php echo $supercheckout['step']['cart']['two-column']['row']; ?>" />
                                                            <input   type="text"  class="sort col-data-inside" name="supercheckout[step][cart][two-column][column-inside]" value="<?php echo $supercheckout['step']['cart']['two-column']['column-inside']; ?>" />
                                                        </div>
                                                    </li>
                                                    <li class="portlet" col-data="<?php echo $supercheckout['step']['confirm']['two-column']['column']; ?>" row-data="<?php echo $supercheckout['step']['confirm']['two-column']['row']; ?>" col-inside-data="<?php echo $supercheckout['step']['confirm']['two-column']['column-inside']; ?>">
                                                        <div class="portlet-header"><i class="icon-small-confirm"></i><?php echo $supercheckout_text_confirm; ?></div>
                                                        <div class="portlet-content">
                                                            <div class="text"><?php echo $supercheckout_text_confirm_description; ?></div>
                                                            <div class="text"><i class="icon-drag"></i><i class="icon-drag"></i></div>
                                                            <input   type="text"  class="sort col-data" name="supercheckout[step][confirm][two-column][column]" value="<?php echo $supercheckout['step']['confirm']['two-column']['column']; ?>" />
                                                            <input   type="text"  class="sort row-data" name="supercheckout[step][confirm][two-column][row]" value="<?php echo $supercheckout['step']['confirm']['two-column']['row']; ?>" />
                                                            <input   type="text"  class="sort col-data-inside" name="supercheckout[step][confirm][two-column][column-inside]" value="<?php echo $supercheckout['step']['confirm']['two-column']['column-inside']; ?>" />
                                                        </div>
                                                    </li>
													
                                                    <?php foreach($supercheckout['step']['html'] as $k=>$v){ ?>
                                                    <li class="portlet" style="display:none" id="portlet_<?php echo $k; ?>" col-data="<?php echo $supercheckout['step']['html'][$k]['two-column']['column']; ?>" row-data="<?php echo $supercheckout['step']['html'][$k]['two-column']['row']; ?>" col-inside-data="<?php echo $supercheckout['step']['html'][$k]['two-column']['column-inside']; ?>">
                                                        <div class="portlet-header"><?php echo $supercheckout_text_html; ?></div>
                                                        <div class="portlet-content" id="portlet_content_<?php echo $k; ?>">
                                                            <div class="text" style="overflow:visible !important;" >
                                                            
                                                            <a data-toggle="tooltip"  data-placement="top" data-original-title=" Add new HTML content" id="duplicate_button_<?php echo $k; ?>" data="0" class="glyphicons more_windows"  onClick="duplicate_html(this.id);" ><i></i></a>
                                                            
                                                            <a data-toggle="tooltip"  data-placement="top" data-original-title="Edit this HTML content" id="modals-bootbox-prompt_<?php echo $k; ?>" data-toggle="modal" class="glyphicons edit"  ><i></i></a>
                                                            <?php if($k !="0_0"){ ?>
                                                            <a data-toggle="tooltip"  data-placement="top" data-original-title="Remove this HTML content" id="delete_button_<?php echo $k; ?>" data="<?php echo $k; ?>" data-toggle="modal" class="glyphicons remove"  onClick="remove_html(this.id);" ><i></i></a>
                                                            <?php } ?>
                                                            </div>
                                                            
                                                            <input id="col_text_<?php echo $k; ?>"   type="text"  class="sort col-data" name="supercheckout[step][html][<?php echo $k; ?>][two-column][column]" value="<?php echo $supercheckout['step']['html'][$k]['two-column']['column']; ?>" />
                                                            <input id="row_text_<?php echo $k; ?>"  type="text"  class="sort row-data" name="supercheckout[step][html][<?php echo $k; ?>][two-column][row]" value="<?php echo $supercheckout['step']['html'][$k]['two-column']['row']; ?>" />
                                                            <input id="col_inside_text_<?php echo $k; ?>"  type="text"  class="sort col-data-inside" name="supercheckout[step][html][<?php echo $k; ?>][two-column][column-inside]" value="<?php echo $supercheckout['step']['html'][$k]['two-column']['column-inside']; ?>" />
                                                        </div>
                                                    </li>                                                    
                                                    <?php } ?>

                                                </ul>
                                                <ul id="column-2" class="columnmk column-2" col-data="2" >

                                                    <ul id="column-2-upper" class="column column-1" col-data="1" col-inside-data="2" style="min-height: 30px !important; width:100% !important; height:auto !important;">

                                                    </ul>
                                                    <div class="columns">
                                                        <input type="text" id="column-1-inside-text"  class="column-data-1 col" name="supercheckout[general][column_width][two-column][inside][1]" value="<?php echo $supercheckout['general']['column_width']['two-column']['inside'][1]; ?>" />
                                                        <input type="text" id="column-2-inside-text"  class="column-data-2 col" name="supercheckout[general][column_width][two-column][inside][2]" value="<?php echo $supercheckout['general']['column_width']['two-column']['inside'][2]; ?>" />
                                                    </div>
                                                    <div id="slider_inside" class="ui-editRangeSlider" style="clear:both;"></div>

                                                    <ul id="column-1-inside" class="column column-1" col-inside-data="3" col-data="1" style="min-height: 30px !important; height:auto !important;">

                                                    </ul>
                                                    <ul id="column-2-inside" class="column column-2" col-inside-data="3" col-data="2" style="min-height: 30px !important; height:auto !important;"></ul>
                                                    <hr class="design-separator" size="2">
                                                    <ul id="column-2-lower" class="column column-1" col-data="1" col-inside-data="4" style="min-height: 30px !important; width:100% !important; height:auto !important;">

                                                    </ul>        
                                                </ul>
												
                                                 <div class="portlet" style="display:none">
                                                        <div class="portlet-header"><?php echo $supercheckout_text_html_footer; ?></div>
                                                        <div class="portlet-content">
                                                            <div class="text" style="overflow:visible !important;" >
                                                            
                                                            <a data-toggle="tooltip"  data-placement="top" data-original-title="Edit this HTML content" id="modals-bootbox-prompt_footer" data-toggle="modal" class="glyphicons edit" ><i></i></a>
                                                            </div>
                                                        </div>
                                                </div>
                                                <br style="clear:both">

                                                </td>
                                                
                                                
                                            <?php } else if($layout == '1-Column') { ?>
                                            
                                                     <td  colspan="2" style="position:static">

                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][payment_address][two-column][column]" value="<?php echo $supercheckout['step']['payment_address']['two-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][payment_address][two-column][row]" value="<?php echo $supercheckout['step']['payment_address']['two-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][payment_address][two-column][column-inside]" value="<?php echo $supercheckout['step']['payment_address']['two-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][login][two-column][column]" value="<?php echo $supercheckout['step']['login']['two-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][login][two-column][row]" value="<?php echo $supercheckout['step']['login']['two-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][login][two-column][column-inside]" value="<?php echo $supercheckout['step']['login']['two-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][shipping_address][two-column][column]" value="<?php echo $supercheckout['step']['shipping_address']['two-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][shipping_address][two-column][row]" value="<?php echo $supercheckout['step']['shipping_address']['two-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][shipping_address][two-column][column-inside]" value="<?php echo $supercheckout['step']['shipping_address']['two-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][shipping_method][two-column][column]" value="<?php echo $supercheckout['step']['shipping_method']['two-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][shipping_method][two-column][row]" value="<?php echo $supercheckout['step']['shipping_method']['two-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][shipping_method][two-column][column-inside]" value="<?php echo $supercheckout['step']['shipping_method']['two-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][payment_method][two-column][column]" value="<?php echo $supercheckout['step']['payment_method']['two-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][payment_method][two-column][row]" value="<?php echo $supercheckout['step']['payment_method']['two-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][payment_method][two-column][column-inside]" value="<?php echo $supercheckout['step']['payment_method']['two-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][cart][two-column][column]" value="<?php echo $supercheckout['step']['cart']['two-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][cart][two-column][row]" value="<?php echo $supercheckout['step']['cart']['two-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][cart][two-column][column-inside]" value="<?php echo $supercheckout['step']['cart']['two-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][confirm][two-column][column]" value="<?php echo $supercheckout['step']['confirm']['two-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][confirm][two-column][row]" value="<?php echo $supercheckout['step']['confirm']['two-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][confirm][two-column][column-inside]" value="<?php echo $supercheckout['step']['confirm']['two-column']['column-inside']; ?>" />
                                                
												<input   type="hidden"  class="sort col-data" name="supercheckout[step][html][0_0][two-column][column]" value="<?php echo $supercheckout['step']['html']['0_0']['two-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][html][0_0][two-column][row]" value="<?php echo $supercheckout['step']['html']['0_0']['two-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][html][0_0][two-column][column-inside]" value="<?php echo $supercheckout['step']['html']['0_0']['two-column']['column-inside']; ?>" />
                                                
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][payment_address][one-column][column]" value="<?php echo $supercheckout['step']['payment_address']['one-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][payment_address][one-column][row]" value="<?php echo $supercheckout['step']['payment_address']['one-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][payment_address][one-column][column-inside]" value="<?php echo $supercheckout['step']['payment_address']['one-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][login][one-column][column]" value="<?php echo $supercheckout['step']['login']['one-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][login][one-column][row]" value="<?php echo $supercheckout['step']['login']['one-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][login][one-column][column-inside]" value="<?php echo $supercheckout['step']['login']['one-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][shipping_address][one-column][column]" value="<?php echo $supercheckout['step']['shipping_address']['one-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][shipping_address][one-column][row]" value="<?php echo $supercheckout['step']['shipping_address']['one-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][shipping_address][one-column][column-inside]" value="<?php echo $supercheckout['step']['shipping_address']['one-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][shipping_method][one-column][column]" value="<?php echo $supercheckout['step']['shipping_method']['one-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][shipping_method][one-column][row]" value="<?php echo $supercheckout['step']['shipping_method']['one-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][shipping_method][one-column][column-inside]" value="<?php echo $supercheckout['step']['shipping_method']['one-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][payment_method][one-column][column]" value="<?php echo $supercheckout['step']['payment_method']['one-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][payment_method][one-column][row]" value="<?php echo $supercheckout['step']['payment_method']['one-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][payment_method][one-column][column-inside]" value="<?php echo $supercheckout['step']['payment_method']['one-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][cart][one-column][column]" value="<?php echo $supercheckout['step']['cart']['one-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][cart][one-column][row]" value="<?php echo $supercheckout['step']['cart']['one-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][cart][one-column][column-inside]" value="<?php echo $supercheckout['step']['cart']['one-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][confirm][one-column][column]" value="<?php echo $supercheckout['step']['confirm']['one-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][confirm][one-column][row]" value="<?php echo $supercheckout['step']['confirm']['one-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][confirm][one-column][column-inside]" value="<?php echo $supercheckout['step']['confirm']['one-column']['column-inside']; ?>" />
                                                
												<input   type="hidden"  class="sort col-data" name="supercheckout[step][html][0_0][one-column][column]" value="<?php echo $supercheckout['step']['html']['0_0']['one-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][html][0_0][one-column][row]" value="<?php echo $supercheckout['step']['html']['0_0']['one-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][html][0_0][one-column][column-inside]" value="<?php echo $supercheckout['step']['html']['0_0']['one-column']['column-inside']; ?>" />
                                                
                                                 <input   type="hidden"  class="sort col-data" name="supercheckout[step][payment_address][three-column][column]" value="<?php echo $supercheckout['step']['payment_address']['three-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][payment_address][three-column][row]" value="<?php echo $supercheckout['step']['payment_address']['three-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][payment_address][three-column][column-inside]" value="<?php echo $supercheckout['step']['payment_address']['three-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][login][three-column][column]" value="<?php echo $supercheckout['step']['login']['three-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][login][three-column][row]" value="<?php echo $supercheckout['step']['login']['three-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][login][three-column][column-inside]" value="<?php echo $supercheckout['step']['login']['three-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][shipping_address][three-column][column]" value="<?php echo $supercheckout['step']['shipping_address']['three-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][shipping_address][three-column][row]" value="<?php echo $supercheckout['step']['shipping_address']['three-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][shipping_address][three-column][column-inside]" value="<?php echo $supercheckout['step']['shipping_address']['three-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][shipping_method][three-column][column]" value="<?php echo $supercheckout['step']['shipping_method']['three-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][shipping_method][three-column][row]" value="<?php echo $supercheckout['step']['shipping_method']['three-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][shipping_method][three-column][column-inside]" value="<?php echo $supercheckout['step']['shipping_method']['three-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][payment_method][three-column][column]" value="<?php echo $supercheckout['step']['payment_method']['three-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][payment_method][three-column][row]" value="<?php echo $supercheckout['step']['payment_method']['three-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][payment_method][three-column][column-inside]" value="<?php echo $supercheckout['step']['payment_method']['three-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][cart][three-column][column]" value="<?php echo $supercheckout['step']['cart']['three-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][cart][three-column][row]" value="<?php echo $supercheckout['step']['cart']['three-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][cart][three-column][column-inside]" value="<?php echo $supercheckout['step']['cart']['three-column']['column-inside']; ?>" />
                                                <input   type="hidden"  class="sort col-data" name="supercheckout[step][confirm][three-column][column]" value="<?php echo $supercheckout['step']['confirm']['three-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][confirm][three-column][row]" value="<?php echo $supercheckout['step']['confirm']['three-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][confirm][three-column][column-inside]" value="<?php echo $supercheckout['step']['confirm']['three-column']['column-inside']; ?>" />
                                                
												<input   type="hidden"  class="sort col-data" name="supercheckout[step][html][0_0][three-column][column]" value="<?php echo $supercheckout['step']['html']['0_0']['three-column']['column']; ?>" />
                                                <input   type="hidden"  class="sort row-data" name="supercheckout[step][html][0_0][three-column][row]" value="<?php echo $supercheckout['step']['html']['0_0']['three-column']['row']; ?>" />
                                                <input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][html][0_0][three-column][column-inside]" value="<?php echo $supercheckout['step']['html']['0_0']['three-column']['column-inside']; ?>" />
                                            
<!--                                            mk-->
                                            <input type="hidden"  class="column-data-1 col" name="supercheckout[general][column_width][three-column][1]" value="<?php echo $supercheckout['general']['column_width']['three-column'][1]; ?>" />
                                            <input type="hidden"  class="column-data-2 col" name="supercheckout[general][column_width][three-column][2]" value="<?php echo $supercheckout['general']['column_width']['three-column'][2]; ?>" />
                                            <input type="hidden"  class="column-data-2 col" name="supercheckout[general][column_width][three-column][3]" value="<?php echo $supercheckout['general']['column_width']['three-column'][3]; ?>" />
                                            <input type="hidden"  class="column-data-3 col" name="supercheckout[general][column_width][three-column][inside][1]" value="<?php echo $supercheckout['general']['column_width']['three-column']['inside'][1]; ?>" />
                                            <input type="hidden"  class="column-data-3 col" name="supercheckout[general][column_width][three-column][inside][2]" value="<?php echo $supercheckout['general']['column_width']['three-column']['inside'][2]; ?>" />
                                            
                                            <input type="hidden"  class="column-data-1 col" name="supercheckout[general][column_width][two-column][1]" value="<?php echo $supercheckout['general']['column_width']['two-column'][1]; ?>" />
                                            <input type="hidden"  class="column-data-2 col" name="supercheckout[general][column_width][two-column][2]" value="<?php echo $supercheckout['general']['column_width']['two-column'][2]; ?>" />
                                            <input type="hidden"  class="column-data-2 col" name="supercheckout[general][column_width][two-column][3]" value="<?php echo $supercheckout['general']['column_width']['two-column'][3]; ?>" />
                                            <input type="hidden"  class="column-data-3 col" name="supercheckout[general][column_width][two-column][inside][1]" value="<?php echo $supercheckout['general']['column_width']['two-column']['inside'][1]; ?>" />
                                            <input type="hidden"  class="column-data-3 col" name="supercheckout[general][column_width][two-column][inside][2]" value="<?php echo $supercheckout['general']['column_width']['two-column']['inside'][2]; ?>" />
                                            
                                            <input type="hidden"  class="column-data-1 col" name="supercheckout[general][column_width][one-column][1]" value="<?php echo $supercheckout['general']['column_width']['one-column'][1]; ?>" />
                                            <input type="hidden"  class="column-data-2 col" name="supercheckout[general][column_width][one-column][2]" value="<?php echo $supercheckout['general']['column_width']['one-column'][2]; ?>" />
                                            <input type="hidden"  class="column-data-2 col" name="supercheckout[general][column_width][one-column][3]" value="<?php echo $supercheckout['general']['column_width']['one-column'][3]; ?>" />
                                            <input type="hidden"  class="column-data-3 col" name="supercheckout[general][column_width][one-column][inside][1]" value="<?php echo $supercheckout['general']['column_width']['one-column']['inside'][1]; ?>" />
                                            <input type="hidden"  class="column-data-3 col" name="supercheckout[general][column_width][one-column][inside][2]" value="<?php echo $supercheckout['general']['column_width']['one-column']['inside'][2]; ?>" />
                                            
<!--                                            mk-->                                            
                                            <input type="hidden"  class="sort col-data" name="supercheckout[step][payment_address][three-column][column]" value="<?php echo $supercheckout['step']['payment_address']['three-column']['column']; ?>" />
                                            <input type="hidden"  class="sort row-data" name="supercheckout[step][payment_address][three-column][row]" value="<?php echo $supercheckout['step']['payment_address']['three-column']['row']; ?>" />
                                            <input type="hidden"  class="sort col-data" name="supercheckout[step][login][three-column][column]" value="<?php echo $supercheckout['step']['login']['three-column']['column']; ?>" />
                                            <input type="hidden"  class="sort row-data" name="supercheckout[step][login][three-column][row]" value="<?php echo $supercheckout['step']['login']['three-column']['row']; ?>" />
                                            <input type="hidden"  class="sort col-data" name="supercheckout[step][shipping_address][three-column][column]" value="<?php echo $supercheckout['step']['shipping_address']['three-column']['column']; ?>" />
                                            <input type="hidden"  class="sort row-data" name="supercheckout[step][shipping_address][three-column][row]" value="<?php echo $supercheckout['step']['shipping_address']['three-column']['row']; ?>" />
                                            <input type="hidden"  class="sort col-data" name="supercheckout[step][shipping_method][three-column][column]" value="<?php echo $supercheckout['step']['shipping_method']['three-column']['column']; ?>" />
                                            <input type="hidden"  class="sort row-data" name="supercheckout[step][shipping_method][three-column][row]" value="<?php echo $supercheckout['step']['shipping_method']['three-column']['row']; ?>" />
                                            <input type="hidden"  class="sort col-data" name="supercheckout[step][payment_method][three-column][column]" value="<?php echo $supercheckout['step']['payment_method']['three-column']['column']; ?>" />
                                            <input type="hidden"  class="sort row-data" name="supercheckout[step][payment_method][three-column][row]" value="<?php echo $supercheckout['step']['payment_method']['three-column']['row']; ?>" />
                                            <input type="hidden"  class="sort col-data" name="supercheckout[step][cart][three-column][column]" value="<?php echo $supercheckout['step']['cart']['three-column']['column']; ?>" />
                                            <input type="hidden"  class="sort row-data" name="supercheckout[step][cart][three-column][row]" value="<?php echo $supercheckout['step']['cart']['three-column']['row']; ?>" />
                                            <input type="hidden"  class="sort col-data" name="supercheckout[step][confirm][three-column][column]" value="<?php echo $supercheckout['step']['confirm']['three-column']['column']; ?>" />
                                            <input type="hidden"  class="sort row-data" name="supercheckout[step][confirm][three-column][row]" value="<?php echo $supercheckout['step']['confirm']['three-column']['row']; ?>" />

											<input type="hidden"  class="sort col-data" name="supercheckout[step][html][0_0][three-column][column]" value="<?php echo $supercheckout['step']['html']['0_0']['three-column']['column']; ?>" />
                                            <input type="hidden"  class="sort row-data" name="supercheckout[step][html][0_0][three-column][row]" value="<?php echo $supercheckout['step']['html']['0_0']['three-column']['row']; ?>" />
                                            <div class="portlet" style="display:none">
                                                        <div class="portlet-header"><?php echo $supercheckout_text_html_header; ?></div>
                                                        <div class="portlet-content">
                                                            <div class="text" style="overflow:visible !important;" >
                                                            
                                                            <a data-toggle="tooltip"  data-placement="top" data-original-title="Edit this HTML content" id="modals-bootbox-prompt_header" data-toggle="modal" class="glyphicons edit" ><i></i></a>
                                                            </div>
                                                        </div>
                                            </div>
                                                        <ul id="column-1" class="column column-1" col-data="1" col-inside-data="1" style="width:100%  !important;">
                                                            <li class="portlet" row-data="<?php echo $supercheckout['step']['payment_address']['one-column']['row']; ?>" >
                                                                <div class="portlet-header"><i class="icon-small-payment-address"></i><?php echo $supercheckout_text_payment_address; ?></div>
                                                                <div class="portlet-content">
                                                                    <div class="text"><?php echo $supercheckout_text_payment_address_description; ?></div>
                                                                    <div class="text"><i class="icon-drag"></i><i class="icon-drag"></i></div>
                                                                    <input   type="text"  class="sort row-data" name="supercheckout[step][payment_address][one-column][row]" value="<?php echo $supercheckout['step']['payment_address']['one-column']['row']; ?>" />
                                                                </div>
                                                            </li>
                                                            <li class="portlet" row-data="<?php echo $supercheckout['step']['login']['one-column']['row']; ?>">
                                                                <div class="portlet-header"><i class="icon-small-payment-address"></i><?php echo $supercheckout_text_login; ?></div>
                                                                <div class="portlet-content">
                                                                    <div class="text"><?php echo $supercheckout_text_payment_address_description; ?></div>
                                                                    <div class="text"><i class="icon-drag"></i><i class="icon-drag"></i></div>
                                                                    <input   type="text"  class="sort row-data" name="supercheckout[step][login][one-column][row]" value="<?php echo $supercheckout['step']['login']['one-column']['row']; ?>" />
                                                                </div>
                                                            </li>
                                                            <li class="portlet" row-data="<?php echo $supercheckout['step']['shipping_address']['one-column']['row']; ?>">
                                                                <div class="portlet-header"><i class="icon-small-shipping-address"></i><?php echo $supercheckout_text_shipping_address; ?></div>
                                                                <div class="portlet-content">
                                                                    <div class="text"><?php echo $supercheckout_text_shipping_address_description; ?></div>
                                                                    <div class="text"><i class="icon-drag"></i><i class="icon-drag"></i></div>
                                                                    <input   type="text"  class="sort row-data" name="supercheckout[step][shipping_address][one-column][row]" value="<?php echo $supercheckout['step']['shipping_address']['one-column']['row']; ?>" />
                                                                </div>
                                                            </li>
                                                            <li class="portlet" row-data="<?php echo $supercheckout['step']['shipping_method']['one-column']['row']; ?>">
                                                                <div class="portlet-header"><i class="icon-small-shipping-method"></i><?php echo $supercheckout_text_shipping_method; ?></div>
                                                                <div class="portlet-content">
                                                                    <div class="text"><?php echo $supercheckout_text_shipping_method_description; ?></div>
                                                                    <div class="text"><i class="icon-drag"></i><i class="icon-drag"></i></div>
                                                                    <input   type="text"  class="sort row-data" name="supercheckout[step][shipping_method][one-column][row]" value="<?php echo $supercheckout['step']['shipping_method']['one-column']['row']; ?>" />
                                                                </div>
                                                            </li>
                                                            <li class="portlet" row-data="<?php echo $supercheckout['step']['payment_method']['one-column']['row']; ?>">
                                                                <div class="portlet-header"><i class="icon-small-payment-method"></i><?php echo $supercheckout_text_payment_method; ?></div>
                                                                <div class="portlet-content">
                                                                    <div class="text"><?php echo $supercheckout_text_payment_method_description; ?></div>
                                                                    <div class="text"><i class="icon-drag"></i><i class="icon-drag"></i></div>
                                                                    <input   type="text"  class="sort row-data" name="supercheckout[step][payment_method][one-column][row]" value="<?php echo $supercheckout['step']['payment_method']['one-column']['row']; ?>" />
                                                                </div>
                                                            </li>
                                                            <li class="portlet" row-data="<?php echo $supercheckout['step']['cart']['one-column']['row']; ?>">
                                                                <div class="portlet-header"><i class="icon-small-confirm"></i><?php echo $supercheckout_text_cart; ?></div>
                                                                <div class="portlet-content">
                                                                    <div class="text"><?php echo $supercheckout_text_cart_description; ?></div>
                                                                    <div class="text"><i class="icon-drag"></i><i class="icon-drag"></i></div>
                                                                    <input   type="text"  class="sort row-data" name="supercheckout[step][cart][one-column][row]" value="<?php echo $supercheckout['step']['cart']['one-column']['row']; ?>" />
                                                                </div>
                                                            </li>
                                                            <li class="portlet"  row-data="<?php echo $supercheckout['step']['confirm']['one-column']['row']; ?>">
                                                                <div class="portlet-header"><i class="icon-small-confirm"></i><?php echo $supercheckout_text_confirm; ?></div>
                                                                <div class="portlet-content">
                                                                    <div class="text"><?php echo $supercheckout_text_confirm_description; ?></div>
                                                                    <div class="text"><i class="icon-drag"></i><i class="icon-drag"></i></div>
                                                                    <input   type="text"  class="sort row-data" name="supercheckout[step][confirm][one-column][row]" value="<?php echo $supercheckout['step']['confirm']['one-column']['row']; ?>" />
                                                                </div>
                                                            </li>
															<li class="portlet" style="display:none"  row-data="<?php echo $supercheckout['step']['html']['0_0']['one-column']['row']; ?>">
                                                                <div class="portlet-header"><i class="icon-small-confirm"></i><?php echo $supercheckout_text_html; ?></div>
                                                                <div class="portlet-content">
                                                                    <div class="text"><?php echo $supercheckout_text_html_description; ?></div>
                                                                    <div class="text"><i class="icon-drag"></i><i class="icon-drag"></i></div>
                                                                    <input   type="text"  class="sort row-data" name="supercheckout[step][html][0_0][one-column][row]" value="<?php echo $supercheckout['step']['html']['0_0']['one-column']['row']; ?>" />
                                                                </div>
                                                            </li>
                                                            <?php foreach($supercheckout['step']['html'] as $k=>$v){  ?>
                                                                <li class="portlet" style="display:none"  id="portlet_<?php echo $k; ?>" row-data="<?php echo $supercheckout['step']['html'][$k]['one-column']['row']; ?>">
                                                                    <div class="portlet-header"><?php echo $supercheckout_text_html; ?></div>
                                                                    <div class="portlet-content" id="portlet_content_<?php echo $k; ?>">
                                                                        <div class="text" style="overflow:visible !important;" >
                                                                        <a data-toggle="tooltip"  data-placement="top" data-original-title=" Add new HTML content" id="duplicate_button_<?php echo $k; ?>" data="0" class="glyphicons more_windows"  onClick="duplicate_html(this.id);" ><i></i></a>

                                                                        <a data-toggle="tooltip"  data-placement="top" data-original-title="Edit this HTML content" id="modals-bootbox-prompt_<?php echo $k; ?>" data-toggle="modal" class="glyphicons edit"  ><i></i></a>
                                                                        <?php if($k !="0_0"){ ?>
                                                                        <a data-toggle="tooltip"  data-placement="top" data-original-title="Remove this HTML content" id="delete_button_<?php echo $k; ?>" data="<?php echo $k; ?>" data-toggle="modal" class="glyphicons remove"  onClick="remove_html(this.id);" ><i></i></a>
                                                                        <?php } ?>
                                                                        </div>

                                                                        <input id="row_text_<?php echo $k; ?>"  type="text"  class="sort row-data" name="supercheckout[step][html][<?php echo $k; ?>][one-column][row]" value="<?php echo $supercheckout['step']['html'][$k]['one-column']['row']; ?>" />
                                                                    </div>
                                                                </li>                                                    
                                                            <?php } ?>


                                                        </ul>
                                                <div class="portlet" style="display:none">
                                                        <div class="portlet-header"><?php echo $supercheckout_text_html_footer; ?></div>
                                                        <div class="portlet-content">
                                                            <div class="text" style="overflow:visible !important;" >
                                                            
                                                            <a data-toggle="tooltip"  data-placement="top" data-original-title="Edit this HTML content" id="modals-bootbox-prompt_footer" data-toggle="modal" class="glyphicons edit" ><i></i></a>
                                                            </div>
                                                        </div>
                                                </div>
                                                    <br style="clear:both">
                                                        </td>
                                                    
                                            <?php } ?>
                                        </tr>
                                        <tr>
                                            <td colspan="2" class="hidden"><?php if(isset($supercheckout['general']['checkout_style'])){ ?>
                                                <textarea name="supercheckout[general][checkout_style]" id="general_checkout_style" ><?php echo $supercheckout['general']['checkout_style']; ?></textarea>
                                                <?php }else{ ?>
                                                <textarea name="supercheckout[general][checkout_style]" id="general_checkout_style"></textarea>
                                                <?php } ?>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                </div>
            </div>
            <!-- layout-->
            </form>
        </div>
        <!-- content tabs--> 
    </div>
    <!-- box -->
    
    <?php
    $column_1 = '';
    $column_2 = '';
    $column_3 = '';
    $column_4 = '';
    $column_5 = '';
    if($layout == '3-Column') {
        $main_width = 100/100;
        $column_1 =  $supercheckout['general']['column_width']['three-column'][1]/$main_width; 
        $column_2 = $supercheckout['general']['column_width']['three-column'][2]/$main_width;
        $column_3 = $supercheckout['general']['column_width']['three-column'][3]/$main_width-1;
    } else if($layout == '2-Column') {
        $main_width = 100/100;
        $column_1 =  $supercheckout['general']['column_width']['two-column'][1]/$main_width; 
        $column_2 = $supercheckout['general']['column_width']['two-column'][2]/$main_width-1;
        $column_4 = $supercheckout['general']['column_width']['two-column']['inside'][1]/$main_width;
        $column_5 = $supercheckout['general']['column_width']['two-column']['inside'][2]/$main_width-1;
    }
    ?>
    <style type="text/css">
        
        tr.even { background-color: #EDEDED; }
        tr.odd { background-color: white; }
        .column-1, .column-data-1{width:<?php echo $column_1; ?>%;}
        .column-2, .column-data-2{width:<?php echo $column_2; ?>%;} 
        .column-3, .column-data-3{width:<?php echo $column_3; ?>%;}
        #column-1-inside,#column-1-inside-text {width:<?php echo $column_4; ?>%;}
        #column-2-inside,#column-2-inside-text {width:<?php echo $column_5; ?>%;}

    </style>

<script type="text/javascript">
    function save_modal(){
        $.ajax( {
            type: "POST",
            url: $('#form').attr( 'action' ) + '&save',
            data: $('#form').serialize(),
            beforeSend: function() {
                $('#form').fadeTo('slow', 0.4);
            },
            complete: function() {
                $('#form').fadeTo('slow', 1);		
            },
            success: function( response ) {            
                $('.gritter-add-primary').trigger('click');
                $('#button_close_modal').trigger('click');
            }
        } );
    }
$(function() {
	
    $('.sortable > tr').tsort({attr:'sort-data'});
	
    $( ".sortable" ).sortable({
        revert: true,
        cursor: "move",
        items: "> .sort-item",
        containment: "document",
        distance: 5 ,
        opacity: 0.8,
        stop: function( event, ui ) {
            $(this).find("tr").each(function(i, el){
                $(this).find(".sort").val($(el).index())
                $('.alternate').each(function() {
                    $('tr:odd',  this).addClass('odd').removeClass('even');
                    $('tr:even', this).addClass('even').removeClass('odd');
                });
            });
        }
    });
    <?php if($layout=='3-Column'){ ?>
    var main_width = 100 / 100;
	
    $( "#slider" ).slider({
        range: true,	  
        min: 0,
        max: 100,
        step: 1.00,
        values: [ <?php echo $column_1; ?>,  <?php echo ($column_1 + $column_2); ?>],
        slide: function( event, ui ) {
				
            $('#three-column-1').val(Math.round(main_width*(ui.values[ 0 ])))
            .attr('width-data', ui.values[ 0 ])
            .attr('left-data', 0)
            .css({'width' : parseInt( ui.values[ 0 ] ) + '%'})
            $('#three-column-2').val(Math.round(main_width*(ui.values[ 1 ] - ui.values[ 0 ])))
            .attr('width-data',ui.values[ 1 ] - ui.values[ 0 ])
            .attr('left-data', parseInt(ui.values[ 0 ]+10))
            .css({'width' : parseInt( ui.values[ 1 ] - ui.values[ 0 ]) + '%'})
            $('#three-column-3').val(Math.round(main_width*(100 - ui.values[ 1 ])))
            .attr('width-data',100 - ui.values[ 1 ]-1)
            .attr('left-data', parseInt(ui.values[ 1 ]))
            .css({'width' : parseInt( 100 - ui.values[ 1 ]-1) + '%'})
            $('.column-1').css({'width' :  parseInt( ui.values[ 0 ]) +'%' })
            $('.column-2').css({'width' : parseInt( ui.values[ 1 ] - ui.values[ 0 ])+'%'})
            $('.column-3').css({'width' :  parseInt(100 - ui.values[ 1 ]) +'%'})
				
              
        }
    });
    $( ".column" ).sortable({
        connectWith: ".column",
        scroll: false,
        stop: function( event, ui ) {
            $('.column').find("li").each(function(i, el){
				
                $(this).find(".row-data").val($(el).index())
                $(this).find(".col-data").val($(this).parent().attr('col-data'))

            });
        }
    });
 
    $( ".column" ).disableSelection();
    $('.column > li').tsort({attr:'row-data'});
    $('.column > li').each(function(){
        $(this).appendTo('.column-' + $(this).attr('col-data'));					
    })
    <?php }elseif($layout=='2-Column'){ ?>
        var main_width = 100 / 100;
	
    $( "#slider" ).slider({
        range: false,	  
        min: 0,
        max: 100,
        step: 1.00,
        values: [ <?php echo $column_1; ?>],
        slide: function( event, ui ) {
				
            $('#column-1-text').val(Math.round(main_width*(ui.values[ 0 ])))
            .attr('width-data', ui.values[ 0 ])
            .attr('left-data', 0)
            .css({'width' : parseInt( ui.values[ 0 ] ) + '%'})
            $('#column-2-text').val(Math.round(main_width*(100 - ui.values[ 0 ])))
            .attr('width-data',100 - ui.values[ 0 ]-1)
            .attr('left-data', parseInt(ui.values[ 0 ]))
            .css({'width' : parseInt( 100 - ui.values[ 0 ]-1) + '%'})           
            $('#column-1').css({'width' :  parseInt( ui.values[ 0 ]) +'%' })
            $('#column-2').css({'width' :  parseInt(100 - ui.values[ 0 ]-1) +'%'})
        }
    });
    var main_width_inside = 100 / 100;
	
    $( "#slider_inside" ).slider({
        range: false,	  
        min: 0,
        max: 100,
        step: 1.00,
        values: [ <?php echo $column_4; ?>],
        slide: function( event, ui ) {
				
            $('#column-1-inside-text').val(Math.round(main_width_inside*(ui.values[ 0 ])))
            .attr('width-data', ui.values[ 0 ])
            .attr('left-data', 0)
            .css({'width' : parseInt( ui.values[ 0 ] ) + '%'})
            $('#column-2-inside-text').val(Math.round(main_width_inside*(100 - ui.values[ 0 ])))
            .attr('width-data',100 - ui.values[ 0 ]-1)
            .attr('left-data', parseInt(ui.values[ 0 ]))
            .css({'width' : parseInt( 100 - ui.values[ 0 ]-1) + '%'})           
            $('#column-1-inside').css({'width' :  parseInt( ui.values[ 0 ]) +'%' })
            $('#column-2-inside').css({'width' :  parseInt(100 - ui.values[ 0 ]-1) +'%'})
        }
    });
    $( ".column" ).sortable({
        connectWith: ".column",
        scroll: false,
        stop: function( event, ui ) {
            $('.column').find("li").each(function(i, el){
				
                $(this).find(".row-data").val($(el).index())
                $(this).find(".col-data").val($(this).parent().attr('col-data'))
                $(this).find(".col-data-inside").val($(this).parent().attr('col-inside-data'))

            });
        }
    });
 
    $( ".column" ).disableSelection();
    $('.column > li').tsort({attr:'col-inside-data'});
    $('.column > li').each(function(){
    if($(this).attr('col-inside-data')=="4"){    
        $(this).appendTo('#column-2-lower' );
    }
    else if($(this).attr('col-inside-data')=="3"){    
        $(this).appendTo('#column-1-inside' );
    }else if($(this).attr('col-inside-data')=="2"){
        $(this).appendTo('#column-2-upper');
    }else{
        $(this).appendTo('#column-1');
    }
        
    })
    $('#column-1 > li').tsort({attr:'row-data'});
    $('#column-1 > li').each(function(){
        $(this).appendTo('#column-' + $(this).attr('col-data') );    
        
    })
    $('#column-2-upper > li').tsort({attr:'row-data'});
    $('#column-2-upper > li').each(function(){
        $(this).appendTo('#column-2-upper' );    
        
    })
    $('#column-2-lower > li').tsort({attr:'row-data'});
    $('#column-2-lower > li').each(function(){
        $(this).appendTo('#column-2-lower' );    
        
    })
    $('#column-1-inside > li').tsort({attr:'row-data'});
    $('#column-1-inside > li').each(function(){
        $(this).appendTo('#column-' + $(this).attr('col-data')+'-inside' );    
        
    })
    
    <?php }elseif($layout=='1-Column'){ ?>
        $( ".column" ).sortable({
        connectWith: ".column",
        scroll: false,
        stop: function( event, ui ) {
            $('.column').find("li").each(function(i, el){
				
                $(this).find(".row-data").val($(el).index())                

            });
        }
    });
 
    $( ".column" ).disableSelection();
    $('#column-1 > li').tsort({attr:'row-data'});
    $('#column-1 > li').each(function(){
        $(this).appendTo('#column-1' );    
        
    })
    <?php } ?>
    
});
//adding alternate colors to  column
$(function(){        
    $('.alternate').each(function() {
        $('tr:odd',  this).addClass('odd').removeClass('even');
        $('tr:even', this).addClass('even').removeClass('odd');
    });
});
function save(){
    $.ajax( {
        type: "POST",
        url: $('#form').attr( 'action' ) + '&save',
        data: $('#form').serialize(),
        beforeSend: function() {
            $('#form').fadeTo('slow', 0.4);
        },
        complete: function() {
            $('#form').fadeTo('slow', 1);		
        },
        success: function( response ) {            
            $('.gritter-add-primary').trigger('click');
        }
    } );	
}
function autosave(locate){
    $.ajax( {
        type: "POST",
        url: $('#form').attr( 'action' ) + '&save',
        data: $('#form').serialize(),
        beforeSend: function() {
            $('#form').fadeTo('slow', 0.9);
        },
        complete: function() {
            $('#form').fadeTo('slow', 1);		
        },
        success: function( response ) {
            if(locate!=""){
                location=locate;
            }
        }
    } );	
}
<?php foreach($supercheckout['step']['payment_address']['fields'] as $field){ ?>
$("#guest_payment_address_fields_"+"<?php echo $field['id']; ?>"+"_display").change(function(){
    if($(this).is(":checked")){
        $("#uniform-guest_payment_address_fields_"+"<?php echo $field['id']; ?>"+"_require").removeClass('disabled');

        $("#guest_payment_address_fields_"+"<?php echo $field['id']; ?>"+"_require").removeAttr('disabled');
    }else{
        $("#guest_payment_address_fields_"+"<?php echo $field['id']; ?>"+"_require").attr('disabled','disabled');
        $("#uniform-guest_payment_address_fields_"+"<?php echo $field['id']; ?>"+"_require").addClass('disabled');


    }
});
$("#logged_payment_address_fields_"+"<?php echo $field['id']; ?>"+"_display").change(function(){
    if($(this).is(":checked")){
        $("#uniform-logged_payment_address_fields_"+"<?php echo $field['id']; ?>"+"_require").removeClass('disabled');

        $("#logged_payment_address_fields_"+"<?php echo $field['id']; ?>"+"_require").removeAttr('disabled');
    }else{
        $("#logged_payment_address_fields_"+"<?php echo $field['id']; ?>"+"_require").attr('disabled','disabled');
        $("#uniform-logged_payment_address_fields_"+"<?php echo $field['id']; ?>"+"_require").addClass('disabled');

    }
});
$("#logged_payment_address_fields_"+"<?php echo $field['id']; ?>"+"_display").trigger('change');
$("#guest_payment_address_fields_"+"<?php echo $field['id']; ?>"+"_display").trigger('change');



$("#guest_shipping_address_fields_"+"<?php echo $field['id']; ?>"+"_display").change(function(){
    if($(this).is(":checked")){
        $("#uniform-guest_shipping_address_fields_"+"<?php echo $field['id']; ?>"+"_require").removeClass('disabled');

        $("#guest_shipping_address_fields_"+"<?php echo $field['id']; ?>"+"_require").removeAttr('disabled');
    }else{
        $("#guest_shipping_address_fields_"+"<?php echo $field['id']; ?>"+"_require").attr('disabled','disabled');
        $("#uniform-guest_shipping_address_fields_"+"<?php echo $field['id']; ?>"+"_require").addClass('disabled');


    }
});
$("#logged_shipping_address_fields_"+"<?php echo $field['id']; ?>"+"_display").change(function(){
    if($(this).is(":checked")){
        $("#uniform-logged_shipping_address_fields_"+"<?php echo $field['id']; ?>"+"_require").removeClass('disabled');

        $("#logged_shipping_address_fields_"+"<?php echo $field['id']; ?>"+"_require").removeAttr('disabled');
    }else{
        $("#logged_shipping_address_fields_"+"<?php echo $field['id']; ?>"+"_require").attr('disabled','disabled');
        $("#uniform-logged_shipping_address_fields_"+"<?php echo $field['id']; ?>"+"_require").addClass('disabled');

    }
});
$("#logged_shipping_address_fields_"+"<?php echo $field['id']; ?>"+"_display").trigger('change');
$("#guest_shipping_address_fields_"+"<?php echo $field['id']; ?>"+"_display").trigger('change');
    <?php } ?>
$("#guest_confirm_fields_agree_display").change(function(){
if($(this).is(":checked")){                    

    $("#guest_confirm_fields_agree_require").removeAttr('disabled');
}else{
    $("#guest_confirm_fields_agree_require").attr('disabled','disabled');
    $("#guest_confirm_fields_agree_require").addClass('disabled');
}
});
$("#logged_confirm_fields_agree_display").change(function(){
if($(this).is(":checked")){

    $("#logged_confirm_fields_agree_require").removeAttr('disabled');
}else{

    $("#logged_confirm_fields_agree_require").attr('disabled','disabled');


}
});
$("#guest_confirm_fields_agree_display").trigger('change');
$("#logged_confirm_fields_agree_display").trigger('change');
<?php foreach($supercheckout['step']['html'] as $k=>$v){  ?>

    $('#modals-bootbox-prompt_<?php echo $k; ?>').click(function(){

        if($("#modals-bootbox-prompt_h_<?php echo $k; ?>").length){
            var stored_value = $('#modals-bootbox-prompt_h_<?php echo $k; ?>').val();
        }else{
            hidden_field = '<input type="hidden" id="modals-bootbox-prompt_h_<?php echo $k; ?>" name="supercheckout[step][html][<?php echo $k; ?>][value]" value="<?php if(isset($supercheckout["step"]["html"]["<?php echo $k; ?>"]["value"])){ echo addslashes($supercheckout["step"]["html"]["<?php echo $k; ?>"]["value"]); } ?>">'
            $('#tab_design_checkout').append(hidden_field);
            var stored_value="";
        }

        bootbox.confirm('<h4><?php echo $html_content; ?></h4><textarea id="text_area_html" class="supercheckout_textarea_html" name="supercheckout[step][html][<?php echo $k; ?>][value]">'+ stored_value +'</textarea>',
        function(result) {
            if(result){
            html_string=$('#text_area_html').val().replace(/(\r\n|\n|\r)/gm, "<br/>");
                $('#modals-bootbox-prompt_h_<?php echo $k; ?>').val(html_string);
                save();
            }
        });
    });      
<?php } ?>
$('#modals-bootbox-prompt_header').click(function(){

    if($("#modals-bootbox-prompt_h_header").length){
        var stored_value = $('#modals-bootbox-prompt_h_header').val();;
    }else{
        hidden_field = '<input type="hidden" id="modals-bootbox-prompt_h_header" name="supercheckout[step][html_value][value][header]" value="<?php if(isset($supercheckout["step"]["html_value"]["value"]["header"])){ echo addslashes($supercheckout["step"]["html_value"]["value"]["header"]); } ?>">'
        $('#tab_design_checkout').append(hidden_field);
        var stored_value="";
    }
    
    bootbox.confirm('<h4><?php echo $html_content; ?></h4><textarea id="text_area_html" class="supercheckout_textarea_html" name="supercheckout[step][html_value][value][header]">'+ stored_value +'</textarea>',
    function(result) {
        if(result){
            html_string=$('#text_area_html').val().replace(/(\r\n|\n|\r)/gm, "<br/>");
            $('#modals-bootbox-prompt_h_header').val(html_string);
            save();
        }
    });
});  
$('#modals-bootbox-prompt_footer').click(function(){

    if($("#modals-bootbox-prompt_h_footer").length){
        var stored_value = $('#modals-bootbox-prompt_h_footer').val();;
    }else{
        hidden_field = '<input type="hidden" id="modals-bootbox-prompt_h_footer" name="supercheckout[step][html_value][value][footer]" value="<?php if(isset($supercheckout["step"]["html_value"]["value"]["footer"])){ echo addslashes($supercheckout["step"]["html_value"]["value"]["footer"]); } ?>">'
        $('#tab_design_checkout').append(hidden_field);
        var stored_value="";
    }    
    bootbox.confirm('<h4><?php echo $html_content; ?></h4><textarea id="text_area_html" class="supercheckout_textarea_html" name="supercheckout[step][html_value][value][footer]">'+ stored_value +'</textarea>',
    function(result) {
        if(result){
            html_string=$('#text_area_html').val().replace(/(\r\n|\n|\r)/gm, "<br/>");
            $('#modals-bootbox-prompt_h_footer').val(html_string);
            save();
        }
    });
});  
</script> 
<script type="text/javascript">

function duplicate_html(id){
var portlet_id = $('#'+id).parent().parent().attr('id');
var col_data=$('#'+portlet_id +' .col-data').val();
var row_data=$('#'+portlet_id +' .row-data').val();
if("<?php echo $layout; ?>"=='2-Column'){ 
    var col_data_inside=$('#'+portlet_id +' .col-data-inside').val();
}else{
    var col_data_inside=4;
}
    var data = $('#value_modal').val();
    var new_data =  parseInt(data);
    new_data++;
    $('#value_modal').val(new_data);                                                            
    string = '<li id="portlet_'+ data +'_'+ data +'" class="portlet" col-data="" row-data="" col-inside-data="">';
    string += '<div class="portlet-header"><?php echo $supercheckout_text_html; ?></div>';
    string += '<div id="portlet_content_'+  data+'_'+ data +'" class="portlet-content">';
    string += '<div class="text" style="overflow:visible !important;" >';
    string += '<a data-toggle="tooltip"  data-placement="top" data-original-title="Add new HTML content" id="duplicate_button_'+  data+'_'+ data +'" data="'+ (new_data) +'" class="glyphicons more_windows" onClick="duplicate_html(this.id);" ><i></i></a>';
    string += '<a data-toggle="tooltip"  data-placement="top" data-original-title="Edit this HTML content" id="modals-bootbox-prompt_'+  data+'_'+ data +'" data-toggle="modal" class="glyphicons edit" ><i></i></a>';
    string += '<a data-toggle="tooltip"  data-placement="top" data-original-title="Remove this HTML content" id="delete_button_'+  data+'_'+ data +'" data="'+  data+'_'+ data +'" data-toggle="modal" class="glyphicons remove"  onClick="remove_html(this.id);" ><i></i></a>';
    string += '</div>';
    
    string += '<input   type="hidden"  class="sort col-data" name="supercheckout[step][html]['+  data+'_'+ data +'][two-column][column]" value="'+ col_data +'" />';
    string += '<input   type="hidden"  class="sort row-data" name="supercheckout[step][html]['+  data+'_'+ data +'][two-column][row]" value="'+ row_data +'" />';
    string += '<input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][html]['+  data+'_'+ data +'][two-column][column-inside]" value="'+ col_data_inside +'" />';
    
    
    string += '<input   type="hidden"  class="sort col-data" name="supercheckout[step][html]['+  data+'_'+ data +'][one-column][column]" value="'+ col_data +'" />';
    string += '<input   type="hidden"  class="sort row-data" name="supercheckout[step][html]['+  data+'_'+ data +'][one-column][row]" value="'+ row_data +'" />';
    string += '<input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][html]['+  data+'_'+ data +'][one-column][column-inside]" value="'+ col_data_inside +'" />';
    
    
    string += '<input   type="hidden"  class="sort col-data" name="supercheckout[step][html]['+  data+'_'+ data +'][three-column][column]" value="'+ col_data +'" />';
    string += '<input   type="hidden"  class="sort row-data" name="supercheckout[step][html]['+  data+'_'+ data +'][three-column][row]" value="'+ row_data +'" />';
    string += '<input   type="hidden"  class="sort col-data-inside" name="supercheckout[step][html]['+  data+'_'+ data +'][three-column][column-inside]" value="'+ col_data_inside +'" />';

    if("<?php echo $layout; ?>"=='3-Column'){ 
        string += '<input id="col_text_'+  data+'_'+ data +'"  type="text"  class="sort col-data" name="supercheckout[step][html]['+ data+'_'+ data +'][three-column][column]" value="'+ col_data +'" />';
        string += '<input id="row_text_'+  data+'_'+ data +'"  type="text"  class="sort row-data" name="supercheckout[step][html]['+ data+'_'+ data +'][three-column][row]" value="'+ row_data +'" />';
    }    
    if("<?php echo $layout; ?>"=='2-Column'){ 
        string += '<input id="col_text_'+  data+'_'+ data +'"  type="text"  class="sort col-data" name="supercheckout[step][html]['+ data+'_'+ data +'][two-column][column]" value="'+ col_data +'" />';
        string += '<input id="row_text_'+  data+'_'+ data +'"  type="text"  class="sort row-data" name="supercheckout[step][html]['+ data+'_'+ data +'][two-column][row]" value="'+ row_data +'" />';
        string += '<input id="col_inside_text_'+  data+'_'+ data +'"  type="text"  class="sort col-data-inside" name="supercheckout[step][html]['+ data+'_'+ data +'][two-column][row]" value="'+ col_data_inside +'" />';
    }
    if("<?php echo $layout; ?>"=='1-Column'){ 
        string += '<input id="row_text_'+  data+'_'+ data +'"  type="text"  class="sort row-data" name="supercheckout[step][html]['+ data+'_'+ data +'][one-column][row]" value="'+ row_data +'" />';
    }
    string += '</div>';
    string += '</li>';
     script = '<script type="text/javascript">';
    
    script += '$("#modals-bootbox-prompt_'+  data+'_'+ data +'").click(function(){ ';
    script += 'if($("#modals-bootbox-prompt_h_'+  data+'_'+ data +'").length){ ';
    script += 'var stored_value = $("#modals-bootbox-prompt_h_'+  data+'_'+ data +'").val();';
    script +=    '}else{ ';
    script += 'hidden_field = \'<input type="hidden" id="modals-bootbox-prompt_h_'+  data+'_'+ data +'" name="supercheckout[step][html]['+  data+'_'+ data +'][value]" value="<?php if(isset($supercheckout["step"]["html"]["'+  data+'_'+ data +'"]["value"])){ echo addslashes($supercheckout["step"]["html"]["'+  data+'_'+ data +'"]["value"]); } ?>">\';';
    script +=  '$("#tab_design_checkout").append(hidden_field);';
    script += 'var stored_value="";';
    script +='}';

    script +=    'bootbox.confirm(\'<h4><?php echo $html_content; ?></h4><textarea id="text_area_html" class="supercheckout_textarea_html" name="supercheckout[step][html]['+  data+'_'+ data +'][value]">\'+ stored_value +\'</textarea>\',';
    script +='function(result) { ';
    script +=        'if(result){ ';
    script +='html_string=$("#text_area_html").val().replace(/(\\r\\n|\\n|\\r)/gm, "<br/>");';
    script +='$("#modals-bootbox-prompt_h_'+  data+'_'+ data +'").val(html_string);';
    script +='save();';
    script +='        }';
        script +=' });';
    script += '});';
    script += '$(\'[data-toggle="tooltip"]\').tooltip();';
    script +='</script'+'>';  
    string += script;
    var a = $('#'+id).parent().parent().parent().parent().append(string);

}
function remove_html(id){
    
    var data = $('#'+id).attr('data');
    $('#portlet_'+ data).remove();
    $('#modals-bootbox-prompt_h_'+ data).remove();
    $('#three_col_h_'+data).remove();
    $('#three_row_h_'+data).remove();
    $('#three_col_ins_h_'+data).remove();
    $('#two_col_h_'+data).remove();
    $('#two_row_h_'+data).remove();
    $('#two_col_ins_h_'+data).remove();
    $('#one_col_h_'+data).remove();
    $('#one_row_h_'+data).remove();
    $('#one_col_ins_h_'+data).remove();
}
</script>
    <div class="wait"><span></span></div>  

</div>
<!-- // Content END -->

</div>
<div class="clearfix"></div>
<!-- // Sidebar menu & content wrapper END -->

</div>

<script src="view/javascript/supercheckout/theme/demo/common.js?1386063042"></script>

<!-- Bootstrap -->
<script src="view/javascript/supercheckout/bootstrap/bootstrap.min.js"></script>

<!-- Bootstrap Extended -->
<script src="view/javascript/supercheckout/bootstrap/extend/bootstrap-select/bootstrap-select.js"></script>
<script src="view/javascript/supercheckout/bootstrap/extend/bootstrap-switch/static/js/bootstrap-switch.js"></script>

<!-- Gritter Notifications Plugin -->
<script src="view/javascript/supercheckout/theme/plugins/notifications/Gritter/js/jquery.gritter.min.js"></script>

<!-- Notyfy Notifications Plugin -->
<script src="view/javascript/supercheckout/theme/plugins/notifications/notyfy/jquery.notyfy.js"></script>
<script src="view/javascript/supercheckout/theme/demo/notifications.js"></script>

<!-- Cookie Plugin -->
<script src="view/javascript/supercheckout/theme/plugins/system/jquery.cookie.js"></script>


<!-- Colors -->
<script>
if($.cookie('designTab')==1){
    $(this).parent().siblings().find('li').removeClass('active');
    $("#design_tab_anchor").trigger('click');
    $.cookie('designTab',0);
}

var primaryColor = '#496CAD',
dangerColor = '#bd362f',
successColor = '#609450',
warningColor = '#ab7a4b',
inverseColor = '#45484d';
</script>

<!-- Themer -->
<script>
var themerPrimaryColor = primaryColor;
</script>

<script src="view/javascript/supercheckout/theme/demo/themer.js"></script>
<!--<script src="view/javascript/supercheckout/theme/plugins/system/jquery.min.js"></script>-->
<script src="view/javascript/supercheckout/theme/plugins/color/jquery-miniColors/jquery.miniColors.js"></script>
<!-- Dashboard Demo Script -->
<!--<script src="view/javascript/supercheckout/theme/demo/index.js?1386063042"></script>-->
<div id="themer" class="collapse">
    <div class="wrapper">
        <span class="close2">&times; close</span>
        <h4>Themer</h4>
        <ul>
            <li>Theme: <select id="themer-theme" class="pull-right"></select><div class="clearfix"></div></li>            
        </ul>
        <div id="themer-getcode" class="hide">
            <hr class="separator" />
            <button class="btn btn-primary btn-small pull-right btn-icon glyphicons download" id="themer-getcode-less"><i></i>Get LESS</button>
            <button class="btn btn-inverse btn-small pull-right btn-icon glyphicons download" id="themer-getcode-css"><i></i>Get CSS</button>
            <div class="clearfix"></div>
        </div>
    </div>
</div>

<?php echo $footer; ?>
<!-- // Main Container Fluid END -->
<!-- // for themer -->
