<?php

class ControllerModuleSupercheckout extends Controller {

    private $error = array();
    private $texts = array('title', 'tooltip', 'description', 'text');

    public function index() {        
              
        //Check for IE if less than IE-7
        $browser = ($this->request->server['HTTP_USER_AGENT']);
        if (preg_match('/(?i)msie [1-7]/', $browser)) {
            $this->data['IE7'] = true;
        } else {
            $this->data['IE7'] = false;
        }

        
        $this->load->language('module/supercheckout');

        $this->document->setTitle($this->language->get('heading_title_main'));

        $this->load->model('setting/setting');

        if (isset($this->request->get['store_id'])) {

            $store_id = $this->request->get['store_id'];

        } else {

            $store_id = 0;

        }
        // Load settings for supercheckout plugin from database or from default settings
        $this->load->model('setting/setting');       
        //check for old settings
        $old_settings = $this->model_setting_setting->getSetting('velocity_supercheckout', $store_id);
        $old_default_settings = $this->model_setting_setting->getSetting('default_supercheckout', 0);                            
        if(!empty($old_settings)){            
            $new_settings=array();
            if(!isset($old_settings['supercheckout']['step']['html']) || isset($old_settings['supercheckout']['guest_manual'])){
                $new_settings=array('default_supercheckout'=>array('guest_manual'=>0,'step'=>array('html'=>array('0_0'=>array(
                                            'sort_order' => 8,
                                            'three-column'=>array('column' => 3, 'row' => 4,'column-inside' => 1),
                                            'two-column'=>array('column' => 2, 'row' => 1,'column-inside' => 4),
                                            'one-column'=>array('column' => 0,'row' => 7,'column-inside' => 1),
                                            'value'=>""
                                            )),'modal_value'=>1)));
                $old_settings['supercheckout']['step']=  array_merge($old_settings['supercheckout']['step'],$new_settings['default_supercheckout']['step']);
                $this->model_setting_setting->editSetting('velocity_supercheckout', $old_settings, $store_id);
            }
        }
        if(!empty($old_default_settings)){            
            $new_settings=array();
            if(isset($old_default_settings['supercheckout']['step']['html']) || isset($old_settings['supercheckout']['guest_manual']) ){
                $new_settings=array('default_supercheckout'=>array('guest_manual'=>0,'step'=>array('html'=>array('0_0'=>array(
                                            'sort_order' => 8,
                                            'three-column'=>array('column' => 3, 'row' => 4,'column-inside' => 1),
                                            'two-column'=>array('column' => 2, 'row' => 1,'column-inside' => 4),
                                            'one-column'=>array('column' => 0,'row' => 7,'column-inside' => 1),
                                            'value'=>""
                                            )),'modal_value'=>1)));
                $old_default_settings['default_supercheckout']['step']=  array_merge($old_default_settings['default_supercheckout']['step'],$new_settings['default_supercheckout']['step']);
                $this->model_setting_setting->editSetting('default_supercheckout', $old_default_settings, $store_id);
            }
        }
        $result = $this->model_setting_setting->getSetting('velocity_supercheckout', $this->config->get('config_store_id'));
        
        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $this->session->data['success'] = $this->language->get('supercheckout_text_success');
            if (isset($this->request->post['supercheckout']['general']['settings']['value'])) {
                $settings = str_replace("amp;", "", urldecode($this->request->post['supercheckout']['general']['settings']['bulk']));
                parse_str($settings, $this->request->post);
            }
            $this->model_setting_setting->editSetting('velocity_supercheckout', $this->request->post, $store_id);
            if (!isset($this->request->post['save'])) {
                $this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
            } else if(!isset($this->session->data['token'])) {
                $this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
            }
        }
        // Adding Styles for Supercheckout Page
        $this->document->addStyle('view/stylesheet/supercheckout/bootstrap/bootstrap.css');
        $this->document->addStyle('view/stylesheet/supercheckout/theme/fonts/glyphicons/css/glyphicons_regular.css');
        $this->document->addStyle('view/stylesheet/supercheckout/theme/fonts/font-awesome/css/font-awesome.min.css');
        $this->document->addStyle('view/stylesheet/supercheckout/theme/scripts/plugins/forms/pixelmatrix-uniform/css/uniform.default.css');
        $this->document->addStyle('view/stylesheet/supercheckout/bootstrap/extend/bootstrap-select/bootstrap-select.css');
        $this->document->addStyle('view/stylesheet/supercheckout/bootstrap/extend/bootstrap-switch/static/stylesheets/bootstrap-switch.css');
        $this->document->addStyle('view/stylesheet/supercheckout/theme/scripts/plugins/forms/select2/select2.css');
        $this->document->addStyle('view/stylesheet/supercheckout/theme/scripts/plugins/notifications/notyfy/jquery.notyfy.css');
        $this->document->addStyle('view/stylesheet/supercheckout/theme/scripts/plugins/notifications/notyfy/themes/default.css');
        $this->document->addStyle('view/stylesheet/supercheckout/theme/scripts/plugins/notifications/Gritter/css/jquery.gritter.css');
        $this->document->addStyle('view/stylesheet/supercheckout/theme/style-light.css?1386063042');
        $this->document->addStyle('view/stylesheet/supercheckout/theme/scripts/plugins/sliders/jQRangeSlider/css/iThing.css');
        $this->document->addStyle('view/stylesheet/supercheckout/theme/scripts/plugins/color/jquery-miniColors/jquery.miniColors.css');

        //Adding required scripts/jquery for supercheckout page
        $this->document->addScript('view/javascript/supercheckout/theme/plugins/system/less.min.js');
        $this->document->addScript('view/javascript/supercheckout/tinysort/jquery.tinysort.min.js');
        $this->document->addScript('view/javascript/supercheckout/jquery/jquery.autosize.min.js');
        $this->document->addScript('view/javascript/supercheckout/uniform/jquery.uniform.min.js');
        $this->document->addScript('view/javascript/supercheckout/codemirror/codemirror.js');
        $this->document->addScript('view/javascript/supercheckout/codemirror/css.js');
        $this->document->addScript('view/javascript/supercheckout/tooltip/tooltip.js');
        $this->document->addScript('view/javascript/supercheckout/bootbox.js');


        $this->data['heading_title'] = $this->language->get('heading_title');
        $this->data['heading_title_main'] = $this->language->get('heading_title_main');

        // Words
        $this->data['settings_display'] = $this->language->get('settings_display');
        $this->data['settings_require'] = $this->language->get('settings_require');
        $this->data['settings_enable'] = $this->language->get('settings_enable');
        $this->data['supercheckout_text_enabled'] = $this->language->get('supercheckout_text_enabled');
        $this->data['supercheckout_text_disabled'] = $this->language->get('supercheckout_text_disabled');

        $this->data['supercheckout_entry_product'] = $this->language->get('supercheckout_entry_product');
        $this->data['supercheckout_entry_image'] = $this->language->get('supercheckout_entry_image');
        $this->data['supercheckout_entry_layout'] = $this->language->get('supercheckout_entry_layout');
        $this->data['supercheckout_entry_position'] = $this->language->get('supercheckout_entry_position');
        $this->data['supercheckout_entry_status'] = $this->language->get('supercheckout_entry_status');
        $this->data['supercheckout_entry_sort_order'] = $this->language->get('supercheckout_entry_sort_order');
        
        $this->data['supercheckout_entry_firstname'] = $this->language->get('supercheckout_entry_firstname');
        $this->data['supercheckout_entry_lastname'] = $this->language->get('supercheckout_entry_lastname');
        $this->data['supercheckout_entry_telephone'] = $this->language->get('supercheckout_entry_telephone');
        $this->data['supercheckout_entry_company'] = $this->language->get('supercheckout_entry_company');
        $this->data['supercheckout_entry_company_id'] = $this->language->get('supercheckout_entry_company_id');
        $this->data['supercheckout_entry_tax_id'] = $this->language->get('supercheckout_entry_tax_id');
        $this->data['supercheckout_entry_address_1'] = $this->language->get('supercheckout_entry_address_1');
        $this->data['supercheckout_entry_address_2'] = $this->language->get('supercheckout_entry_address_2');
        $this->data['supercheckout_entry_postcode'] = $this->language->get('supercheckout_entry_postcode');
        $this->data['supercheckout_entry_city'] = $this->language->get('supercheckout_entry_city');
        $this->data['supercheckout_entry_country'] = $this->language->get('supercheckout_entry_country');
        $this->data['supercheckout_entry_zone'] = $this->language->get('supercheckout_entry_zone');
        $this->data['supercheckout_entry_shipping'] = $this->language->get('supercheckout_entry_shipping');
        
        


        // General Settings tab & info
        $this->data['supercheckout_text_general'] = $this->language->get('supercheckout_text_general');
        $this->data['supercheckout_text_general_enable'] = $this->language->get('supercheckout_text_general_enable');
        $this->data['supercheckout_text_general_guestenable'] = $this->language->get('supercheckout_text_general_guestenable');
        $this->data['supercheckout_text_general_guest_manual'] = $this->language->get('supercheckout_text_general_guest_manual');

        $this->data['supercheckout_text_general_default'] = $this->language->get('supercheckout_text_general_default');
        $this->data['supercheckout_text_register'] = $this->language->get('supercheckout_text_register');
        $this->data['supercheckout_text_guest'] = $this->language->get('supercheckout_text_guest');

        $this->data['supercheckout_text_step_login_option'] = $this->language->get('supercheckout_text_step_login_option');
        $this->data['supercheckout_text_login'] = $this->language->get('supercheckout_text_login');
        $this->data['step_login_option_register_display'] = $this->language->get('supercheckout_text_register');
        $this->data['step_login_option_guest_display'] = $this->language->get('supercheckout_text_guest');

        //login tab and info
        $this->data['supercheckout_text_facebook_login'] = $this->language->get('supercheckout_text_facebook_login');
        $this->data['supercheckout_text_facebook_login_display'] = $this->language->get('supercheckout_text_facebook_login_display');
        $this->data['supercheckout_text_google_login_display'] = $this->language->get('supercheckout_text_google_login_display');
        $this->data['supercheckout_text_facebook_app_id'] = $this->language->get('supercheckout_text_facebook_app_id');
        $this->data['supercheckout_text_facebook_app_secret'] = $this->language->get('supercheckout_text_facebook_app_secret');
        $this->data['supercheckout_text_google_app_id'] = $this->language->get('supercheckout_text_google_app_id');
        $this->data['supercheckout_text_google_client_id'] = $this->language->get('supercheckout_text_google_client_id');
        $this->data['supercheckout_text_google_app_secret'] = $this->language->get('supercheckout_text_google_app_secret');
        

        //Payment address
        $this->data['supercheckout_text_payment_address'] = $this->language->get('supercheckout_text_payment_address');
        $this->data['supercheckout_text_guest_customer'] = $this->language->get('supercheckout_text_guest_customer');
        $this->data['supercheckout_text_registrating_customer'] = $this->language->get('supercheckout_text_registrating_customer');
        $this->data['supercheckout_text_logged_in_customer'] = $this->language->get('supercheckout_text_logged_in_customer');

        //Shipping address
        $this->data['supercheckout_text_shipping_address'] = $this->language->get('supercheckout_text_shipping_address');


        //Shipping method
        $this->data['supercheckout_text_shipping_method'] = $this->language->get('supercheckout_text_shipping_method');
        $this->data['supercheckout_text_shipping_method_display_options'] = $this->language->get('supercheckout_text_shipping_method_display_options');
        $this->data['supercheckout_text_shipping_method_display_title'] = $this->language->get('supercheckout_text_shipping_method_display_title');
        $this->data['supercheckout_text_shipping_method_default_option'] = $this->language->get('supercheckout_text_shipping_method_default_option');

        //Payment method
        $this->data['supercheckout_text_payment_method'] = $this->language->get('supercheckout_text_payment_method');
        $this->data['supercheckout_text_payment_method_display_options'] = $this->language->get('supercheckout_text_payment_method_display_options');
        $this->data['supercheckout_text_payment_method_default_option'] = $this->language->get('supercheckout_text_payment_method_default_option');

        //Cart
        $this->data['supercheckout_text_cart'] = $this->language->get('supercheckout_text_cart');
        $this->data['supercheckout_text_image_size'] = $this->language->get('supercheckout_text_image_size');
        $this->data['supercheckout_text_cart_display'] = $this->language->get('supercheckout_text_cart_display');
        $this->data['supercheckout_text_cart_columns_image'] = $this->language->get('supercheckout_text_cart_columns_image');
        $this->data['supercheckout_text_cart_columns_name'] = $this->language->get('supercheckout_text_cart_columns_name');
        $this->data['supercheckout_text_cart_columns_model'] = $this->language->get('supercheckout_text_cart_columns_model');
        $this->data['supercheckout_text_cart_columns_quantity'] = $this->language->get('supercheckout_text_cart_columns_quantity');
        $this->data['supercheckout_text_cart_columns_price'] = $this->language->get('supercheckout_text_cart_columns_price');
        $this->data['supercheckout_text_cart_columns_total'] = $this->language->get('supercheckout_text_cart_columns_total');
        $this->data['supercheckout_text_cart_option_coupon'] = $this->language->get('supercheckout_text_cart_option_coupon');
        $this->data['supercheckout_text_cart_option_voucher'] = $this->language->get('supercheckout_text_cart_option_voucher');
        $this->data['supercheckout_text_cart_option_reward'] = $this->language->get('supercheckout_text_cart_option_reward');

        //Confirm
        $this->data['supercheckout_text_confirm'] = $this->language->get('supercheckout_text_confirm');
        $this->data['supercheckout_text_confirm_display'] = $this->language->get('supercheckout_text_confirm_display');
        $this->data['supercheckout_text_agree'] = $this->language->get('supercheckout_text_agree');
        $this->data['supercheckout_text_comments'] = $this->language->get('supercheckout_text_comments');        
        
        //HTML
        $this->data['html_content'] = $this->language->get('html_content');
        $this->data['supercheckout_text_html'] = $this->language->get('supercheckout_text_html');
        $this->data['supercheckout_text_html_header'] = $this->language->get('supercheckout_text_html_header');
        $this->data['supercheckout_text_html_footer'] = $this->language->get('supercheckout_text_html_footer');
        $this->data['supercheckout_text_html_description'] = $this->language->get('supercheckout_text_html_description');

        //Design
        $this->data['supercheckout_text_design'] = $this->language->get('supercheckout_text_design');
        $this->data['supercheckout_text_payment_address_description'] = $this->language->get('supercheckout_text_payment_address_description');
        $this->data['supercheckout_text_shipping_address_description'] = $this->language->get('supercheckout_text_shipping_address_description');
        $this->data['supercheckout_text_shipping_method_description'] = $this->language->get('supercheckout_text_shipping_method_description');
        $this->data['supercheckout_text_payment_method_description'] = $this->language->get('supercheckout_text_payment_method_description');
        $this->data['supercheckout_text_cart_description'] = $this->language->get('supercheckout_text_cart_description');
        $this->data['supercheckout_text_confirm_description'] = $this->language->get('supercheckout_text_confirm_description');
        
        
        //Tooltips
        //general
        $this->data['general_enable_supercheckout_tooltip'] = $this->language->get('general_enable_supercheckout_tooltip');
        $this->data['general_guestenable_supercheckout_tooltip'] = $this->language->get('general_guestenable_supercheckout_tooltip');
        $this->data['general_guest_manual_supercheckout_tooltip'] = $this->language->get('general_guest_manual_supercheckout_tooltip');
        $this->data['general_default_supercheckout_tooltip'] = $this->language->get('general_default_supercheckout_tooltip');
        $this->data['step_login_option_supercheckout_tooltip'] = $this->language->get('step_login_option_supercheckout_tooltip');
        $this->data['guest_enable_disabled_supercheckout_tooltip'] = $this->language->get('guest_enable_disabled_supercheckout_tooltip');
        $this->data['field_disabled_supercheckout_tooltip'] = $this->language->get('field_disabled_supercheckout_tooltip');
        //login
        $this->data['facebook_login_display_supercheckout_tooltip'] = $this->language->get('facebook_login_display_supercheckout_tooltip');
        $this->data['facebook_app_id_supercheckout_tooltip'] = $this->language->get('facebook_app_id_supercheckout_tooltip');
        $this->data['facebook_secret_supercheckout_tooltip'] = $this->language->get('facebook_secret_supercheckout_tooltip');
        $this->data['google_login_display_supercheckout_tooltip'] = $this->language->get('google_login_display_supercheckout_tooltip');
        $this->data['google_app_id_supercheckout_tooltip'] = $this->language->get('google_app_id_supercheckout_tooltip');
        $this->data['google_client_id_supercheckout_tooltip'] = $this->language->get('google_client_id_supercheckout_tooltip');
        $this->data['google_secret_supercheckout_tooltip'] = $this->language->get('google_secret_supercheckout_tooltip');
        //shipping method
        $this->data['shipping_method_display_options_supercheckout_tooltip'] = $this->language->get('shipping_method_display_options_supercheckout_tooltip');
        $this->data['shipping_method_display_title_supercheckout_tooltip'] = $this->language->get('shipping_method_display_title_supercheckout_tooltip');
        $this->data['shipping_method_default_option_supercheckout_tooltip'] = $this->language->get('shipping_method_default_option_supercheckout_tooltip');
        //payment method
        $this->data['payment_method_display_options_supercheckout_tooltip'] = $this->language->get('payment_method_display_options_supercheckout_tooltip');
        $this->data['payment_method_default_option_supercheckout_tooltip'] = $this->language->get('payment_method_default_option_supercheckout_tooltip');
        //cart
        $this->data['image_size_supercheckout_tooltip'] = $this->language->get('image_size_supercheckout_tooltip');
        $this->data['cart_display_supercheckout_tooltip'] = $this->language->get('cart_display_supercheckout_tooltip');
        $this->data['cart_option_coupon_supercheckout_tooltip'] = $this->language->get('cart_option_coupon_supercheckout_tooltip');
        $this->data['cart_option_voucher_supercheckout_tooltip'] = $this->language->get('cart_option_voucher_supercheckout_tooltip');
        $this->data['cart_option_coupon_disabled_supercheckout_tooltip'] = $this->language->get('cart_option_coupon_disabled_supercheckout_tooltip');
        $this->data['cart_option_voucher_disabled_supercheckout_tooltip'] = $this->language->get('cart_option_voucher_disabled_supercheckout_tooltip');

        //buttons
        $this->data['button_save'] = $this->language->get('button_save');
        $this->data['button_save_and_stay'] = $this->language->get('button_save_and_stay');
        $this->data['button_cancel'] = $this->language->get('button_cancel');
        $this->data['button_add_module'] = $this->language->get('button_add_module');
        $this->data['button_remove'] = $this->language->get('button_remove');

        //check coupon & voucher status in store

        $this->data['coupon_status']=$this->config->get('coupon_status');
        $this->data['voucher_status']=$this->config->get('voucher_status');
        $store_setting=$this->model_setting_setting->getSetting('config', $store_id);
        $this->data['guest_enable']=$store_setting['config_guest_checkout'];
        $this->load->model('sale/customer_group');
        $results_customer_group = $this->model_sale_customer_group->getCustomerGroup($store_setting['config_customer_group_id']);
        $this->data['company_id_display']=$results_customer_group['company_id_display'];
        $this->data['company_id_required']=$results_customer_group['company_id_required'];
        $this->data['tax_id_display']=$results_customer_group['tax_id_display'];
        $this->data['tax_id_required']=$results_customer_group['tax_id_required'];
        if ($store_setting['config_checkout_id']) {
            $this->load->model('catalog/information');

            $information_info = $this->model_catalog_information->getInformation($this->config->get('config_checkout_id'));

            if ($information_info) {
                $this->data['text_agree'] = 1;
            } else {
                $this->data['text_agree'] = 0;
            }
        } else {
            $this->data['text_agree'] = 0;
        }

        //right menu cookies check
        if (isset($this->request->cookie['rightMenu'])) {
            $this->data['rightMenu'] = true;
        } else {
            $this->data['rightMenu'] = false;
        }

        if (isset($this->error['warning'])) {
            $this->data['error_warning'] = $this->error['warning'];
        } else {
            $this->data['error_warning'] = '';
        }
        //bread crumbs
        $this->data['breadcrumbs'] = array();

        $this->data['breadcrumbs'][] = array(
                'text' => $this->language->get('supercheckout_text_home'),
                'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
                'separator' => false
        );

        $this->data['breadcrumbs'][] = array(
                'text' => $this->language->get('supercheckout_text_module'),
                'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
                'separator' => ' :: '
        );

        $this->data['breadcrumbs'][] = array(
                'text' => $this->language->get('heading_title_main'),
                'href' => $this->url->link('module/supercheckout', 'token=' . $this->session->data['token'], 'SSL'),
                'separator' => ' :: '
        );

        //links
        $this->data['action'] = $this->url->link('module/supercheckout', 'token=' . $this->session->data['token'] . '&store_id=' . $store_id, 'SSL');
        $this->data['route'] = $this->url->link('module/supercheckout', 'token=' . $this->session->data['token'], 'SSL');
        $this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
        $this->data['token'] = $this->session->data['token'];
        $this->data['supercheckout'] = array();

        if (isset($this->request->get['store_id'])) {
            $store_id = $this->request->get['store_id'];
        } else {
            $store_id = $this->config->get('config_store_id');
        }


        if (isset($this->request->post['supercheckout'])) {

            $this->data['supercheckout'] = $this->request->post['supercheckout'];

        } elseif ($this->model_setting_setting->getSetting('velocity_supercheckout', $store_id)) {

            $settings = $this->model_setting_setting->getSetting('velocity_supercheckout', $store_id);
            $this->data['supercheckout'] = $settings['supercheckout'];

        }

        $this->data['supercheckout_modules'] = array();

        if (isset($this->request->post['supercheckout_module'])) {

            $this->data['supercheckout_modules'] = $this->request->post['supercheckout_module'];

        } elseif ($this->model_setting_setting->getSetting('velocity_supercheckout', $store_id)) {

            $modules = $this->model_setting_setting->getSetting('velocity_supercheckout', $store_id);
            if (!empty($modules['supercheckout_module'])) {

                $this->data['supercheckout_modules'] = $modules['supercheckout_module'];

            } else {

                $this->data['supercheckout_modules'] = array();

            }
        }

        //These are default settings (located in system/config/supercheckout_settings.php)
//        $settings = $this->config->get('supercheckout_settings');

        if (empty($settings)) {

//            $this->config->load('supercheckout_settings');
            $settings = $this->model_setting_setting->getSetting('default_supercheckout', 0);
            $this->data['settings'] = $settings['default_supercheckout'];
            $this->data['supercheckout']=$settings['default_supercheckout'];

        }
        if(!isset($this->request->get['layout'])) {
            $this->data['layout']=$this->data['supercheckout']['general']['layout'];
        }else {
            $this->data['layout']=$this->request->get['layout'];
        }
        //store settings
        $settings['general']['default_email'] = $this->config->get('config_email');
        //$settings['step']['payment_address']['fields']['agree']['information_id'] = $this->config->get('config_account_id');
        //$settings['step']['payment_address']['fields']['agree']['error'][0]['information_id'] = $this->config->get('config_account_id');
        $settings['step']['confirm']['fields']['agree']['information_id'] = $this->config->get('config_checkout_id');
        $settings['step']['confirm']['fields']['agree']['error'][0]['information_id'] = $this->config->get('config_checkout_id');

        if (!empty($this->data['supercheckout'])) {

            $this->data['supercheckout'] = $this->merge($settings, $this->data['supercheckout']);

        } else {

            $this->data['supercheckout'] = $settings;

        }
        $this->data['supercheckout']['general']['store_id'] = $store_id;

        //get labels for fields of shipping and Payment Address
//        $lang = $this->get_title($this->data['supercheckout']['step']['payment_address']['fields'], $this->texts);
//        $this->data['supercheckout']['step']['payment_address']['fields'] = $this->merge($this->data['supercheckout']['step']['payment_address']['fields'], $lang);
//
//        $lang = $this->get_title($this->data['supercheckout']['step']['shipping_address']['fields'], $this->texts);
//        $this->data['supercheckout']['step']['shipping_address']['fields'] = $this->merge($this->data['supercheckout']['step']['shipping_address']['fields'], $lang);
//
//        $lang = $this->get_title($this->data['supercheckout']['step']['confirm']['fields'], $this->texts);
//        $this->data['supercheckout']['step']['confirm']['fields'] = $this->merge($this->data['supercheckout']['step']['confirm']['fields'], $lang);

        //Get Shipping methods
        $this->load->model('setting/extension');
        $this->data['shipping_methods'] = array();
        $shipping_methods = $this->model_setting_extension->getInstalled('shipping');
        foreach ($shipping_methods as $shipping) {
            if ($this->config->get($shipping . '_status')) {
                $this->load->language('shipping/' . $shipping);
                $this->data['shipping_methods'][] = array(
                        'code' => $shipping,
                        'title' => $this->language->get('heading_title')
                );
            }
        }

        //Get Payment methods
        $this->load->model('setting/extension');
        $this->data['payment_methods'] = array();
        $payment_methods = $this->model_setting_extension->getInstalled('payment');
        foreach ($payment_methods as $payment) {
            if ($this->config->get($payment . '_status')) {
                $this->load->language('payment/' . $payment);
                $this->data['payment_methods'][] = array(
                        'code' => $payment,
                        'title' => $this->language->get('heading_title')
                );
            }
        }


        //Get stores
        $this->load->model('setting/store');
        $results = $this->model_setting_store->getStores();
        if ($results) {

            $this->data['stores'][] = array('store_id' => 0, 'name' => $this->config->get('config_name'));
            foreach ($results as $result) {
                $this->data['stores'][] = array(
                        'store_id' => $result['store_id'],
                        'name' => $result['name'],
                        'href' => $result['url']
                );
            }
        }

        $this->load->model('design/layout');

        $this->data['layouts'] = $this->model_design_layout->getLayouts();

        $this->load->model('localisation/language');

        $this->data['languages'] = $this->model_localisation_language->getLanguages();

        $this->template = 'module/supercheckout.tpl';
        $this->children = array(
                'common/header',
                'common/footer'
        );

        $this->response->setOutput($this->render());
    }

    private function validate() {

        if (!$this->user->hasPermission('modify', 'module/supercheckout')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }
        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }

    public function merge(array &$array1, array &$array2) {
        $merged = $array1;
        foreach ($array2 as $key => &$value) {
            if (is_array($value) && isset($merged [$key]) && is_array($merged [$key])) {
                $merged [$key] = $this->merge($merged [$key], $value);
            } else {
                $merged [$key] = $value;
            }
        }
        return $merged;
    }

    public function get_title($fields, $texts) {
        $this->load->model('catalog/information');
        $array_full = $fields;
        $result = array();
        foreach ($fields as $key => $value) {
            foreach ($texts as $text) {
                if(isset($array_full[$text])) {
                    if(!is_array($array_full[$text])) {
                        $result[$text] = $this->language->get($array_full[$text]);
                    } else {
                        if(isset($array_full[$text][(int)$this->config->get('config_language_id')])) {
                            $result[$text] = $array_full[$text][(int)$this->config->get('config_language_id')];
                        }else {
                            $result[$text] = current($array_full[$text]);
                        }
                    }
                    if((strpos($result[$text], '%s') !== false) && isset($array_full['information_id'])) {
                        $information_info = $this->model_catalog_information->getInformation($array_full['information_id']);
                        $result[$text] = sprintf($result[$text], $information_info['title']);
                    }
                }
            }
            if(is_array($array_full[$key])) {
                $result[$key] = $this->get_title($array_full[$key], $texts);
            }

        }
        return $result;

    }

    public function install() {
        $this->load->model('setting/setting');
        $default_settings = $this->getDefaultSettings();
        $this->model_setting_setting->editSetting('default_supercheckout', $default_settings, 0);

    }

    public function uninstall() {
        $this->load->model('setting/setting');
        $this->model_setting_setting->deleteSetting('default_supercheckout');
        $this->model_setting_setting->deleteSetting('velocity_supercheckout');
    }
    public function getDefaultSettings(){
        return array('default_supercheckout' => array('general' => array(
                                'enable' => 0,
                                'guestenable' => 0,
                                'guest_manual'=> 0,
                                'layout' => '3-Column',
                                'main_checkout' => 1,
                                'column_width' => array(
                                        'one-column'=>array(
                                                1 => '100',2=>'0',3=>'0','inside'=>array(1 => '0', 2 => '0')),
                                        'three-column'=>array(
                                                1 => '30', 2 => '25', 3 => '45','inside'=>array(1 => '0', 2 => '0')),
                                        'two-column'=>array(1 => '30', 2 => '70',3=>'0','inside'=>array(1 => '50', 2 => '50'))
                                    ),
                                                        
                                                        
                                'default_option' => 'guest',
                                'custom_style' => '',
                                'store_id' => 0,
                                'settings' => array('value' => 0, 'bulk' => '')
                        ),
                        'step' => array(
                                'login' => array(
                                        'sort_order' => 1,
                                        'three-column'=>array('column' => 1, 'row' => 0,'column-inside' => 0),
                                        'two-column'=>array('column' => 1, 'row' => 0,'column-inside' => 1),
                                        'one-column'=>array('column' => 0, 'row' => 0,'column-inside' => 0),
                                        'width' => '50',
                                        'option' => array(
                                                'guest' => array('title' => 'supercheckout_text_guest',
                                                        'description' => 'step_option_guest_desciption',
                                                        'display' => 1
                                                ),
                                                'login' => array('display' => 1
                                                )
                                        ),
                                    'enable_slider'=>0
                                ),
                                'payment_address' => array(
                                        'sort_order' => '2',
                                        'three-column'=>array('column' => 1, 'row' => 1,'column-inside' => 0),
                                        'two-column'=>array('column' => 1, 'row' => 1,'column-inside' => 1),
                                        'one-column'=>array('column' => 0,'row' => 1,'column-inside' => 0),
                                        'width' => '50',
                                        'fields' => array(
                                                'firstname' => array(
                                                        'id' => 'firstname',
                                                        'title' => 'supercheckout_entry_firstname',
                                                        'custom' => 0,
                                                        'display' => 0,
                                                        'require' => 0,
                                                        'sort_order' => 1,
                                                        'class' => ''
                                                ),
                                                'lastname' => array(
                                                        'id' => 'lastname',
                                                        'title' => 'supercheckout_entry_lastname',
                                                        'custom' => 0,
                                                        'display' => 0,
                                                        'require' => 0,
                                                        'sort_order' => 2,
                                                        'class' => ''
                                                ),
                                                'telephone' => array(
                                                        'id' => 'telephone',
                                                        'title' => 'supercheckout_entry_telephone',
                                                        'custom' => 0,
                                                        'display' => 0,
                                                        'require' => 0,
                                                        'sort_order' => 3,
                                                        'class' => ''
                                                ),
                                                'company' => array(
                                                        'id' => 'company',
                                                        'title' => 'supercheckout_entry_company',
                                                        'custom' => 0,
                                                        'display' => 0,
                                                        'require' => 0,
                                                        'sort_order' => 9,
                                                        'class' => ''
                                                ),
                                                'company_id' => array(
                                                        'id' => 'company_id',
                                                        'title' => 'supercheckout_entry_company_id',
                                                        'custom' => 0,
                                                        'display' => 0,
                                                        'require' => 0,
                                                        'sort_order' => 10,
                                                        'class' => ''
                                                ),
                                                'tax_id' => array(
                                                        'id' => 'tax_id',
                                                        'title' => 'supercheckout_entry_tax_id',
                                                        'custom' => 0,
                                                        'display' => 0,
                                                        'require' => 0,
                                                        'sort_order' => 11,
                                                        'class' => ''
                                                ),
                                                'address_1' => array(
                                                        'id' => 'address_1',
                                                        'title' => 'supercheckout_entry_address_1',
                                                        'custom' => 0,
                                                        'display' => 0,
                                                        'require' => 0,
                                                        'sort_order' => 13,
                                                        'class' => ''
                                                ),
                                                'address_2' => array(
                                                        'id' => 'address_2',
                                                        'title' => 'supercheckout_entry_address_2',
                                                        'custom' => 0,
                                                        'display' => 0,
                                                        'require' => 0,
                                                        'sort_order' => 14,
                                                        'class' => ''
                                                ),
                                                'city' => array(
                                                        'id' => 'city',
                                                        'title' => 'supercheckout_entry_city',
                                                        'custom' => 0,
                                                        'display' => 0,
                                                        'require' => 0,
                                                        'sort_order' => 15,
                                                        'class' => ''
                                                ),
                                                'postcode' => array(
                                                        'id' => 'postcode',
                                                        'title' => 'supercheckout_entry_postcode',
                                                        'custom' => 0,
                                                        'display' => 0,
                                                        'require' => 0,
                                                        'sort_order' => 16,
                                                        'class' => ''
                                                ),
                                                'country_id' => array(
                                                        'id' => 'country_id',
                                                        'title' => 'supercheckout_entry_country',
                                                        'custom' => 0,
                                                        'display' => 0,
                                                        'require' => 0,
                                                        'sort_order' => 17,
                                                        'class' => ''
                                                ),
                                                'zone_id' => array(
                                                        'id' => 'zone_id',
                                                        'title' => 'supercheckout_entry_zone',
                                                        'custom' => 0,
                                                        'display' => 0,
                                                        'require' => 0,
                                                        'sort_order' => 18,
                                                        'class' => ''
                                                ),
                                                'shipping' => array(
                                                        'id' => 'shipping',
                                                        'title' => 'supercheckout_entry_shipping',
                                                        'custom' => 0,
                                                        'display' => 0,
                                                        'sort_order' => 20,
                                                        'class' => '',
                                                        'value' => 1
                                                )
                                        )
                                ),
                                'shipping_address' => array(
                                        'sort_order' => '3',
                                        'three-column'=>array('column' => 1, 'row' => 2,'column-inside' => 0),
                                        'two-column'=>array('column' => 1, 'row' => 2,'column-inside' => 1),
                                        'one-column'=>array('column' => 0,'row' => 2,'column-inside' => 0),
                                        'width' => '30',
                                        'fields' => array(
                                                'firstname' => array(
                                                        'id' => 'firstname',
                                                        'title' => 'supercheckout_entry_firstname',
                                                        'custom' => 0,
                                                        'display' => 0,
                                                        'require' => 0,
                                                        'sort_order' => 1,
                                                        'class' => ''
                                                ),
                                                'lastname' => array(
                                                        'id' => 'lastname',
                                                        'title' => 'supercheckout_entry_lastname',
                                                        'custom' => 0,
                                                        'display' => 0,
                                                        'require' => 0,
                                                        'sort_order' => 2,
                                                        'class' => ''
                                                ),
                                                'address_1' => array(
                                                        'id' => 'address_1',
                                                        'title' => 'supercheckout_entry_address_1',
                                                        'custom' => 0,
                                                        'display' => 0,
                                                        'require' => 0,
                                                        'sort_order' => 4,
                                                        'class' => ''
                                                ),
                                                'address_2' => array(
                                                        'id' => 'address_2',
                                                        'title' => 'supercheckout_entry_address_2',
                                                        'custom' => 0,
                                                        'display' => 0,
                                                        'require' => 0,
                                                        'sort_order' => 5,
                                                        'class' => ''
                                                ),
                                                'city' => array(
                                                        'id' => 'city',
                                                        'title' => 'supercheckout_entry_city',
                                                        'custom' => 0,
                                                        'display' => 0,
                                                        'require' => 0,
                                                        'sort_order' => 6,
                                                        'class' => ''
                                                ),
                                                'postcode' => array(
                                                        'id' => 'postcode',
                                                        'title' => 'supercheckout_entry_postcode',
                                                        'custom' => 0,
                                                        'display' => 0,
                                                        'require' => 0,
                                                        'sort_order' => 7,
                                                        'class' => ''
                                                ),
                                                'country_id' => array(
                                                        'id' => 'country_id',
                                                        'title' => 'supercheckout_entry_country',
                                                        'custom' => 0,
                                                        'display' => 0,
                                                        'require' => 0,
                                                        'sort_order' => 8,
                                                        'class' => ''
                                                ),
                                                'zone_id' => array(
                                                        'id' => 'zone_id',
                                                        'title' => 'supercheckout_entry_zone',
                                                        'custom' => 0,
                                                        'display' => 0,
                                                        'require' => 0,
                                                        'sort_order' => 9,
                                                        'class' => ''
                                                )
                                        )
                                ),
                                'shipping_method' => array(
                                        'sort_order' => 4,
                                        'three-column'=>array('column' => 2, 'row' => 0,'column-inside' => 0),
                                        'two-column'=>array('column' => 1, 'row' => 0,'column-inside' => 3),
                                        'one-column'=>array('column' => 0,'row' => 3,'column-inside' => 0),
                                        'display' => 1,
                                        'display_title' => 1,
                                        'display_options' => 1,
                                        'width' => '30'
                                ),
                                'payment_method' => array(
                                        'sort_order' => 5,
                                        'three-column'=>array('column' => 2, 'row' => 1,'column-inside' => 0),
                                        'two-column'=>array('column' => 2, 'row' => 0,'column-inside' => 3),
                                        'one-column'=>array('column' => 0,'row' => 4,'column-inside' => 0),
                                        'display' => 1,
                                        'display_options' => 1,
                                        'width' => '30'
                                ),
                                'cart' => array(
                                        'sort_order' => 6,
                                        'three-column'=>array('column' => 3, 'row' => 0,'column-inside' => 0),
                                        'two-column'=>array('column' => 2, 'row' => 0,'column-inside' => 2),
                                        'one-column'=>array('column' => 0,'row' => 5,'column-inside' => 0),
                                        'image_width' => 230,
                                        'image_height' => 230,
                                        'width' => '50',
                                        'option' => array(
                                                'voucher' => array(
                                                        'id' => 'voucher',
                                                        'title' => array(1 => 'voucher'),
                                                        'tooltip' => array(1 => 'voucher'),
                                                        'type' => 'text',
                                                        'refresh' => '3',
                                                        'custom' => 0,
                                                        'class' => ''
                                                ),
                                                'coupon' => array(
                                                        'id' => 'coupon',
                                                        'title' => array(1 => 'coupon'),
                                                        'tooltip' => array(1 => 'coupon'),
                                                        'type' => 'text',
                                                        'refresh' => '3',
                                                        'custom' => 0,
                                                        'class' => ''
                                                )
                                        ),
                                ),
                                'confirm' => array(
                                        'sort_order' => 7,
                                        'three-column'=>array('column' => 3, 'row' => 1,'column-inside' => 0),
                                        'two-column'=>array('column' => 2, 'row' => 1,'column-inside' => 4),
                                        'one-column'=>array('column' => 0,'row' => 6,'column-inside' => 0),
                                        'width' => '50',
                                        'fields' => array(
                                                'comment' => array(
                                                        'id' => 'comment',
                                                        'title' => 'supercheckout_text_comments',
                                                        'custom' => 0,
                                                        'class' => ''
                                                ),
                                                'agree' => array(
                                                        'id' => 'agree',
                                                        'title' => 'supercheckout_text_agree',
                                                        'value' => 0,
                                                        'custom' => 0,
                                                        'class' => ''
                                                )
                                        )
                                ),                                
                                'html'=>array(
                                    '0_0'=>array(
                                        'sort_order' => 8,
                                        'three-column'=>array('column' => 3, 'row' => 4,'column-inside' => 1),
                                        'two-column'=>array('column' => 2, 'row' => 1,'column-inside' => 4),
                                        'one-column'=>array('column' => 0,'row' => 7,'column-inside' => 1),
                                        'value'=>""
                                        )                                    
                                ),
                                'modal_value'=>1
                        ),
                        'option' => array(
                                'guest' => array(
                                        'display' => 1,
                                        'login' => array(),
                                        'payment_address' => array(
                                                'title' => 'supercheckout_text_your_details',
                                                'description' => 'option_guest_payment_address_description',
                                                'display' => 1,
                                                'fields' => array(
                                                        'firstname' => array('display' => 1,
                                                                'require' => 1
                                                        ),
                                                        'lastname' => array(
                                                                'display' => 1,
                                                                'require' => 1
                                                        ),
                                                        'telephone' => array(
                                                                'display' => 1,
                                                                'require' => 1
                                                        ),
                                                        'company' => array(
                                                                'display' => 1,
                                                                'require' => 0
                                                        ),
                                                        'company_id' => array(
                                                                'display' => 1,
                                                                'require' => 0
                                                        ),
                                                        'customer_group_id' => array(
                                                                'display' => 1,
                                                                'require' => 0
                                                        ),
                                                        'tax_id' => array(
                                                                'display' => 0,
                                                                'require' => 0
                                                        ),
                                                        'address_1' => array(
                                                                'display' => 1,
                                                                'require' => 1
                                                        ),
                                                        'address_2' => array(
                                                                'display' => 0,
                                                                'require' => 0
                                                        ),
                                                        'city' => array(
                                                                'display' => 1,
                                                                'require' => 1
                                                        ),
                                                        'postcode' => array(
                                                                'display' => 1,
                                                                'require' => 1
                                                        ),
                                                        'country_id' => array(
                                                                'display' => 1,
                                                                'require' => 1
                                                        ),
                                                        'zone_id' => array(
                                                                'display' => 1,
                                                                'require' => 1
                                                        ),
                                                        'shipping' => array(
                                                                'display' => 1,
                                                                'value' => '0'
                                                        )
                                                )
                                        ),
                                        'shipping_address' => array(
                                                'display' => 1,
                                                'title' => 'option_guest_shipping_address_title',
                                                'description' => 'option_guest_shipping_address_description',
                                                'fields' => array(
                                                        'firstname' => array(
                                                                'display' => 1,
                                                                'require' => 1
                                                        ),
                                                        'lastname' => array(
                                                                'display' => 0,
                                                                'require' => 0
                                                        ),
                                                        'company' => array(
                                                                'display' => 1,
                                                                'require' => 0
                                                        ),
                                                        'address_1' => array(
                                                                'display' => 1,
                                                                'require' => 1
                                                        ),
                                                        'address_2' => array(
                                                                'display' => 0,
                                                                'require' => 0
                                                        ),
                                                        'city' => array(
                                                                'display' => 1,
                                                                'require' => 0
                                                        ),
                                                        'postcode' => array(
                                                                'display' => 1,
                                                                'require' => 1
                                                        ),
                                                        'country_id' => array(
                                                                'display' => 1,
                                                                'require' => 1
                                                        ),
                                                        'zone_id' => array(
                                                                'display' => 1,
                                                                'require' => 1
                                                        )
                                                )
                                        ),
                                        'shipping_method' => array(
                                                'title' => 'option_guest_shipping_method_title',
                                                'description' => 'supercheckout_text_shipping_method',
                                        ),
                                        'payment_method' => array(
                                                'title' => 'option_guest_payment_method_title',
                                                'description' => 'supercheckout_text_payment_method',
                                        ),
                                        'cart' => array(
                                                'display' => 1,
                                                'option' => array(
                                                        'voucher' => array(
                                                                'display' => 1
                                                        ),
                                                        'coupon' => array(
                                                                'display' => 1
                                                        ),
                                                        'reward' => array(
                                                                'display' => 1
                                                        )
                                                ),
                                                'columns' => array(
                                                        'image' => 1,
                                                        'name' => 1,
                                                        'model' => 1,
                                                        'quantity' => 1,
                                                        'price' => 1,
                                                        'total' => 1
                                                )
                                        ),
                                        'confirm' => array(
                                                'display' => 1,
                                                'fields' => array(
                                                        'comment' => array(
                                                                'display' => 1
                                                        ),
                                                        'agree' => array(
                                                                'display' => 1,
                                                                'require' => 1
                                                        )
                                                )
                                        )
                                ),
                                'logged' => array(
                                        'login' => array(),
                                        'payment_address' => array(
                                                'display' => 1,
                                                'title' => 'option_logged_payment_address_title',
                                                'description' => 'option_logged_payment_address_description',
                                                'fields' => array(
                                                        'firstname' => array('display' => 1,
                                                                'require' => 1
                                                        ),
                                                        'lastname' => array(
                                                                'display' => 1,
                                                                'require' => 1
                                                        ),
                                                        'telephone' => array(
                                                                'display' => 1,
                                                                'require' => 1
                                                        ),
                                                        'company' => array(
                                                                'display' => 1,
                                                                'require' => 0
                                                        ),
                                                        'company_id' => array(
                                                                'display' => 1,
                                                                'require' => 0
                                                        ),
                                                        'customer_group_id' => array(
                                                                'display' => 1,
                                                                'require' => 0
                                                        ),
                                                        'tax_id' => array(
                                                                'display' => 0,
                                                                'require' => 0
                                                        ),
                                                        'address_1' => array(
                                                                'display' => 1,
                                                                'require' => 1
                                                        ),
                                                        'address_2' => array(
                                                                'display' => 0,
                                                                'require' => 0
                                                        ),
                                                        'city' => array(
                                                                'display' => 1,
                                                                'require' => 0
                                                        ),
                                                        'postcode' => array(
                                                                'display' => 1,
                                                                'require' => 1
                                                        ),
                                                        'country_id' => array(
                                                                'display' => 1,
                                                                'require' => 1
                                                        ),
                                                        'zone_id' => array(
                                                                'display' => 1,
                                                                'require' => 1
                                                        ),
                                                        'address_id' => array()
                                                )
                                        ),
                                        'shipping_address' => array(
                                                'display' => 1,
                                                'title' => 'option_logged_shipping_address_title',
                                                'description' => 'option_logged_shipping_address_description',
                                                'fields' => array(
                                                        'firstname' => array(
                                                                'display' => 1,
                                                                'require' => 1
                                                        ),
                                                        'lastname' => array(
                                                                'display' => 0,
                                                                'require' => 0
                                                        ),
                                                        'company' => array(
                                                                'display' => 1,
                                                                'require' => 0
                                                        ),
                                                        'address_1' => array(
                                                                'display' => 1,
                                                                'require' => 1
                                                        ),
                                                        'address_2' => array(
                                                                'display' => 0,
                                                                'require' => 0
                                                        ),
                                                        'city' => array(
                                                                'display' => 1,
                                                                'require' => 1
                                                        ),
                                                        'postcode' => array(
                                                                'display' => 1,
                                                                'require' => 1
                                                        ),
                                                        'country_id' => array(
                                                                'display' => 1,
                                                                'require' => 1
                                                        ),
                                                        'zone_id' => array(
                                                                'display' => 1,
                                                                'require' => 1
                                                        )
                                                )
                                        ),
                                        'shipping_method' => array(
                                                'title' => 'option_logged_shipping_method_title',
                                                'description' => 'supercheckout_text_shipping_method',
                                        ),
                                        'payment_method' => array(
                                                'title' => 'option_logged_payment_method_title',
                                                'description' => 'supercheckout_text_payment_method',
                                        ),
                                        'cart' => array(
                                                'display' => 1,
                                                'option' => array(
                                                        'voucher' => array(
                                                                'display' => 1
                                                        ),
                                                        'coupon' => array(
                                                                'display' => 1
                                                        ),
                                                        'reward' => array(
                                                                'display' => 1
                                                        )
                                                ),
                                                'columns' => array(
                                                        'image' => 1,
                                                        'name' => 1,
                                                        'model' => 1,
                                                        'quantity' => 1,
                                                        'price' => 1,
                                                        'total' => 1
                                                )
                                        ),
                                        'confirm' => array(
                                                'display' => 1,
                                                'fields' => array(
                                                        'comment' => array(
                                                                'display' => 1
                                                        ),
                                                        'agree' => array(
                                                                'display' => 1,
                                                                'require' => 1
                                                        )
                                                )
                                        )
                                )
                        )
        ));
    }
}


?>
