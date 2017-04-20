<?php

class ControllerSupercheckoutConfirm extends Controller {

    public function index() {
        $redirect = '';
        //setting variable for checking customer is logged in
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/supercheckout/confirm.tpl')) {
                $this->data['default_theme']=$this->config->get('config_template');
        }else{
                $this->data['default_theme']='default';
        }
        $this->data['logged'] = $this->customer->isLogged();
        // settings for supercheckout plugin
        $this->load->model('setting/setting');
        
        $result = $this->model_setting_setting->getSetting('velocity_supercheckout', $this->config->get('config_store_id'));
        
        $this->settings = $result['supercheckout'];
        
        $this->data['settings'] = $this->settings;
        if (empty($this->data['settings'])) {
            
            $settings = $this->model_setting_setting->getSetting('default_supercheckout', 0);            
            $this->data['settings'] = $settings['default_supercheckout'];
            $this->data['supercheckout']=$settings['default_supercheckout'];
            
        }
        
        if ($this->cart->hasShipping()) {
            // Validate if shipping address has been set.		
            $this->load->model('account/address');

            if ($this->customer->isLogged() && isset($this->session->data['shipping_address_id'])) {
                
                $shipping_address = $this->model_account_address->getAddress($this->session->data['shipping_address_id']);
                
            } elseif ($this->customer->isLogged() && !isset($this->session->data['shipping_address_id'])) {
                
                $shipping_address['country_id'] = $this->session->data['shipping_country_id'];
                $shipping_address['zone_id'] = $this->session->data['shipping_zone_id'];
                $shipping_address['postcode'] = isset($this->session->data['shipping']['shipping_postcode'])?$this->session->data['shipping']['shipping_postcode']:"";
                
            } elseif (isset($this->session->data['guest'])) {
                
                $shipping_address = $this->session->data['guest']['shipping'];
                
            }
            if (empty($shipping_address)) {
                
                $redirect = $this->url->link('supercheckout/supercheckout', '', 'SSL');
                
            }
        }

        // Validate if payment address has been set.
        $this->load->model('account/address');

        if ($this->customer->isLogged() && isset($this->session->data['payment_address_id'])) {
            
            $payment_address = $this->model_account_address->getAddress($this->session->data['payment_address_id']);
            
        } elseif ($this->customer->isLogged() && !isset($this->session->data['payment_address_id'])) {
            
            $payment_address['country_id'] = $this->session->data['payment_country_id'];
            $payment_address['zone_id'] = $this->session->data['payment_zone_id'];
            
        } elseif (isset($this->session->data['guest'])) {
            
            $payment_address = $this->session->data['guest']['payment'];
            
        }
		
		if(isset($shipping_address['country_id']) && isset($shipping_address['country_id'])) {
            $this->tax->setShippingAddress($shipping_address['country_id'], $shipping_address['zone_id']);
        }
		if(isset($payment_address['country_id']) && isset($payment_address['country_id'])) {
            $this->tax->setPaymentAddress($payment_address['country_id'], $payment_address['zone_id']);
        }
        // Validate cart has products and has stock.	
        if ((!$this->cart->hasProducts() && empty($this->session->data['vouchers'])) || (!$this->cart->hasStock() && !$this->config->get('config_stock_checkout'))) {
            
            $redirect = $this->url->link('checkout/cart');
            
        }

        // Validate minimum quantity requirments.			
        $products = $this->cart->getProducts();

        foreach ($products as $product) {
            $product_total = 0;

            foreach ($products as $product_2) {
                if ($product_2['product_id'] == $product['product_id']) {
                    $product_total += $product_2['quantity'];
                }
            }

            if ($product['minimum'] > $product_total) {
                $redirect = $this->url->link('checkout/cart');

                break;
            }
        }
        if (!$redirect) {
            $total_data = array();
            $total = 0;
            $taxes = $this->cart->getTaxes();

            $this->load->model('setting/extension');

            $sort_order = array();

            $results = $this->model_setting_extension->getExtensions('total');

            foreach ($results as $key => $value) {
                $sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
            }

            array_multisort($sort_order, SORT_ASC, $results);

            foreach ($results as $result) {
                if ($this->config->get($result['code'] . '_status')) {
                    $this->load->model('total/' . $result['code']);

                    $this->{'model_total_' . $result['code']}->getTotal($total_data, $total, $taxes);
                }
            }

            $sort_order = array();
            foreach ($total_data as $key => $value) {
                $sort_order[$key] = $value['sort_order'];
            }

            array_multisort($sort_order, SORT_ASC, $total_data);

            $this->language->load('supercheckout/supercheckout');
            $this->data['text_coupon_code'] = $this->language->get('text_coupon_code');
            $this->data['text_voucher_code'] = $this->language->get('text_voucher_code');
            $this->data['column_action'] = $this->language->get('column_action');
            $this->data['text_coupon_success'] = $this->language->get('text_coupon_success');
            $this->data['text_remove'] = $this->language->get('text_remove');
            $this->data['button_update_link'] = $this->language->get('button_update_link');
            $this->data['text_voucher_success'] = $this->language->get('text_voucher_success');
            $data = array();

            $data['invoice_prefix'] = $this->config->get('config_invoice_prefix');
            $data['store_id'] = $this->config->get('config_store_id');
            $data['store_name'] = $this->config->get('config_name');

            if ($data['store_id']) {
                
                $data['store_url'] = $this->config->get('config_url');
                
            } else {
                
                $data['store_url'] = HTTP_SERVER;
                
            }

            if ($this->customer->isLogged()) {
                $data['customer_id'] = $this->customer->getId();
                $data['customer_group_id'] = $this->customer->getCustomerGroupId();
                $data['firstname'] = $this->customer->getFirstName();
                $data['lastname'] = $this->customer->getLastName();
                $data['email'] = $this->customer->getEmail();
                $telephone=$this->customer->getTelephone();
                if($telephone==""){
                    $data['telephone'] = isset($this->session->data['payment']['payment_telephone'])?$this->session->data['payment']['payment_telephone']:"";
                }else{
                    $data['telephone'] = $telephone;
                }
                $data['fax'] = $this->customer->getFax();

                $this->load->model('account/address');
                if (isset($this->session->data['payment_address_id'])) {
                    
                    $payment_address = $this->model_account_address->getAddress($this->session->data['payment_address_id']);
                    
                } else {
                    
                    $payment_address['firstname'] = isset($this->session->data['payment']['payment_firstname']) ? $this->session->data['payment']['payment_firstname'] : "";
                    $payment_address['lastname'] = isset($this->session->data['payment']['payment_lastname']) ? $this->session->data['payment']['payment_lastname'] : "";
                    $payment_address['country_id'] = $this->session->data['payment_country_id'];
                    $payment_address['zone_id'] = $this->session->data['payment_zone_id'];
                    $payment_address['company'] = isset($this->session->data['payment']['payment_company']) ? $this->session->data['payment']['payment_company'] : "";
                    $payment_address['company_id'] = isset($this->session->data['payment']['payment_company_id']) ? $this->session->data['payment']['payment_company_id'] : "";
                    $payment_address['tax_id'] = isset($this->session->data['payment']['payment_tax_id']) ? $this->session->data['payment']['payment_tax_id'] : "";
                    $payment_address['address_1'] = isset($this->session->data['payment']['payment_address_1']) ? $this->session->data['payment']['payment_address_1'] : "";
                    $payment_address['address_2'] = isset($this->session->data['payment']['payment_address_2']) ? $this->session->data['payment']['payment_address_2'] : "";
                    $payment_address['city'] = isset($this->session->data['payment']['payment_city']) ? $this->session->data['payment']['payment_city'] : "";
                    $payment_address['postcode'] = isset($this->session->data['payment']['payment_postcode']) ? $this->session->data['payment']['payment_postcode'] : "";
                    $payment_address['country_id'] = isset($this->session->data['payment_country_id']) ? $this->session->data['payment_country_id'] : "";
                    
                }
            } elseif (isset($this->session->data['guest'])) {
                
                $data['customer_id'] = isset($this->session->data['guestAccount_customer_id']) ? $this->session->data['guestAccount_customer_id'] : 0;
                $data['customer_group_id'] = $this->session->data['guest']['customer_group_id'];
                $data['firstname'] = $this->session->data['guest']['firstname'];
                $data['lastname'] = $this->session->data['guest']['lastname'];
                $data['email'] = $this->session->data['guest']['email'];
                $data['telephone'] = $this->session->data['guest']['telephone'];
                $data['fax'] = $this->session->data['guest']['fax'];
                $payment_address = $this->session->data['guest']['payment'];
                
            }
            $data['payment_firstname'] = isset($payment_address['firstname']) ? $payment_address['firstname'] : "";
            $data['payment_lastname'] = isset($payment_address['lastname']) ? $payment_address['lastname'] : "";
            $data['payment_company'] = isset($payment_address['company']) ? $payment_address['company'] : "";
            $data['payment_company_id'] = isset($payment_address['company_id']) ? $payment_address['company_id'] : "";
            $data['payment_tax_id'] = isset($payment_address['tax_id']) ? $payment_address['tax_id'] : "";
            $data['payment_address_1'] = isset($payment_address['address_1']) ? $payment_address['address_1'] : "";
            $data['payment_address_2'] = isset($payment_address['address_2']) ? $payment_address['address_2'] : "";
            $data['payment_city'] = isset($payment_address['city']) ? $payment_address['city'] : "";
            $data['payment_postcode'] = isset($payment_address['postcode']) ? $payment_address['postcode'] : "";
            $data['payment_zone'] = isset($payment_address['zone']) ? $payment_address['zone'] : "";
            $data['payment_zone_id'] = isset($payment_address['zone_id']) ? $payment_address['zone_id'] : "";
            $data['payment_country'] = isset($payment_address['country']) ? $payment_address['country'] : "";
            $data['payment_country_id'] = isset($payment_address['country_id']) ? $payment_address['country_id'] : "";
            $data['payment_address_format'] = isset($payment_address['address_format']) ? $payment_address['address_format'] : "";

            if (isset($this->session->data['payment_method']['title'])) {
                
                $data['payment_method'] = $this->session->data['payment_method']['title'];
                
            } else {
                
                $data['payment_method'] = '';
                
            }

            if (isset($this->session->data['payment_method']['code'])) {
                
                $data['payment_code'] = $this->session->data['payment_method']['code'];
                
            } else {
                
                $data['payment_code'] = '';
                
            }

            if ($this->cart->hasShipping()) {
                
                if ($this->customer->isLogged()) {
                    
                    $this->load->model('account/address');
                    if (isset($this->session->data['shipping_address_id'])) {
                        
                        $shipping_address = $this->model_account_address->getAddress($this->session->data['shipping_address_id']);
                        
                    } else {
                        
                        $shipping_address['country_id'] = $this->session->data['shipping_country_id'];
                        $shipping_address['zone_id'] = $this->session->data['shipping_zone_id'];
                        
                    }
                } elseif (isset($this->session->data['guest'])) {
                    
                    $shipping_address = $this->session->data['guest']['shipping'];
                    
                }
                //if shipping address is same as billing address
                if (isset($this->session->data['use_for_shipping'])) {
                                        
                    
                    $shipping_address = $payment_address;
                    
                }
                $data['shipping_firstname'] = isset($shipping_address['firstname']) ? $shipping_address['firstname'] : "";
                $data['shipping_lastname'] = isset($shipping_address['lastname']) ? $shipping_address['lastname'] : "";
                $data['shipping_company'] = isset($shipping_address['company']) ? $shipping_address['company'] : "";
                $data['shipping_address_1'] = isset($shipping_address['address_1']) ? $shipping_address['address_1'] : "";
                $data['shipping_address_2'] = isset($shipping_address['address_2']) ? $shipping_address['address_2'] : "";
                $data['shipping_city'] = isset($shipping_address['city']) ? $shipping_address['city'] : "";
                $data['shipping_postcode'] = isset($shipping_address['postcode']) ? $shipping_address['postcode'] : "";
                $data['shipping_zone'] = isset($shipping_address['zone']) ? $shipping_address['zone'] : "";
                $data['shipping_zone_id'] = isset($shipping_address['zone_id']) ? $shipping_address['zone_id'] : "";                
                $data['shipping_country'] = isset($shipping_address['country']) ? $shipping_address['country'] : "";
                $data['shipping_country_id'] = isset($shipping_address['country_id']) ? $shipping_address['country_id'] : "";
                $data['shipping_address_format'] = isset($shipping_address['address_format']) ? $shipping_address['address_format'] : "";


                if (isset($this->session->data['shipping_method']['title'])) {
                    
                    $data['shipping_method'] = $this->session->data['shipping_method']['title'];
                    
                } else {
                    
                    $data['shipping_method'] = '';
                    
                }

                if (isset($this->session->data['shipping_method']['code'])) {
                    
                    $data['shipping_code'] = $this->session->data['shipping_method']['code'];
                    
                } else {
                    
                    $data['shipping_code'] = '';
                    
                }
            } else {
                
                $data['shipping_firstname'] = '';
                $data['shipping_lastname'] = '';
                $data['shipping_company'] = '';
                $data['shipping_address_1'] = '';
                $data['shipping_address_2'] = '';
                $data['shipping_city'] = '';
                $data['shipping_postcode'] = '';
                $data['shipping_zone'] = '';
                $data['shipping_zone_id'] = '';
                $data['shipping_country'] = '';
                $data['shipping_country_id'] = '';
                $data['shipping_address_format'] = '';
                $data['shipping_method'] = '';
                $data['shipping_code'] = '';
            }
            $product_data = array();

            foreach ($this->cart->getProducts() as $product) {
                $option_data = array();

                foreach ($product['option'] as $option) {
                    if ($option['type'] != 'file') {
                        
                        $value = $option['option_value'];
                        
                    } else {
                        
                        $value = $this->encryption->decrypt($option['option_value']);
                        
                    }

                    $option_data[] = array(
                        'product_option_id' => $option['product_option_id'],
                        'product_option_value_id' => $option['product_option_value_id'],
                        'option_id' => $option['option_id'],
                        'option_value_id' => $option['option_value_id'],
                        'name' => $option['name'],
                        'value' => $value,
                        'type' => $option['type']
                    );
                }

                $product_data[] = array(
                    'product_id' => $product['product_id'],
                    'name' => $product['name'],
                    'model' => $product['model'],
                    'option' => $option_data,
                    'download' => $product['download'],
                    'quantity' => $product['quantity'],
                    'subtract' => $product['subtract'],
                    'price' => $product['price'],
                    'total' => $product['total'],
                    'tax' => $this->tax->getTax($product['price'], $product['tax_class_id']),
                    'reward' => $product['reward']
                );
            }

            // Gift Voucher
            $voucher_data = array();

            if (!empty($this->session->data['vouchers'])) {
                foreach ($this->session->data['vouchers'] as $voucher) {
                    $voucher_data[] = array(
                        'description' => $voucher['description'],
                        'code' => substr(md5(mt_rand()), 0, 10),
                        'to_name' => $voucher['to_name'],
                        'to_email' => $voucher['to_email'],
                        'from_name' => $voucher['from_name'],
                        'from_email' => $voucher['from_email'],
                        'voucher_theme_id' => $voucher['voucher_theme_id'],
                        'message' => $voucher['message'],
                        'amount' => $voucher['amount']
                    );
                }
            }
            $data['products'] = $product_data;
            $data['vouchers'] = $voucher_data;
            $data['totals'] = $total_data;
            $data['comment'] = $this->session->data['comment'];
            $data['total'] = $total;

            if (isset($this->request->cookie['tracking'])) {
                $this->load->model('affiliate/affiliate');

                $affiliate_info = $this->model_affiliate_affiliate->getAffiliateByCode($this->request->cookie['tracking']);
                $subtotal = $this->cart->getSubTotal();

                if ($affiliate_info) {
                    
                    $data['affiliate_id'] = $affiliate_info['affiliate_id'];
                    $data['commission'] = ($subtotal / 100) * $affiliate_info['commission'];
                    
                } else {
                    
                    $data['affiliate_id'] = 0;
                    $data['commission'] = 0;
                    
                }
            } else {
                
                $data['affiliate_id'] = 0;
                $data['commission'] = 0;
                
            }

            $data['language_id'] = $this->config->get('config_language_id');
            $data['currency_id'] = $this->currency->getId();
            $data['currency_code'] = $this->currency->getCode();
            $data['currency_value'] = $this->currency->getValue($this->currency->getCode());
            $data['ip'] = $this->request->server['REMOTE_ADDR'];

            if (!empty($this->request->server['HTTP_X_FORWARDED_FOR'])) {
                
                $data['forwarded_ip'] = $this->request->server['HTTP_X_FORWARDED_FOR'];
                
            } elseif (!empty($this->request->server['HTTP_CLIENT_IP'])) {
                
                $data['forwarded_ip'] = $this->request->server['HTTP_CLIENT_IP'];
                
            } else {
                
                $data['forwarded_ip'] = '';
                
            }

            if (isset($this->request->server['HTTP_USER_AGENT'])) {
                
                $data['user_agent'] = $this->request->server['HTTP_USER_AGENT'];
                
            } else {
                
                $data['user_agent'] = '';
                
            }

            if (isset($this->request->server['HTTP_ACCEPT_LANGUAGE'])) {
                
                $data['accept_language'] = $this->request->server['HTTP_ACCEPT_LANGUAGE'];
                
            } else {
                
                $data['accept_language'] = '';
                
            }

            $this->load->model('supercheckout/order');
            $this->load->model('checkout/order');
            $this->load->model('tool/image');
            //creates order for the first time
            if (!isset($this->session->data['order_id'])) {

                $this->session->data['order_id'] = $this->model_checkout_order->addOrder($data);
                
            }
            //edits order if already created
            else {
                
                $this->model_supercheckout_order->editOrder($this->session->data['order_id'], $data);
                
            }
            
            $this->data['column_name'] = $this->language->get('column_name');
            $this->data['column_model'] = $this->language->get('column_model');
            $this->data['column_quantity'] = $this->language->get('column_quantity');
            $this->data['column_price'] = $this->language->get('column_price');
            $this->data['column_total'] = $this->language->get('column_total');


            $this->data['products'] = array();

            foreach ($this->cart->getProducts() as $product) {
                $option_data = array();

                foreach ($product['option'] as $option) {
                    if ($option['type'] != 'file') {
                        
                        $value = $option['option_value'];
                        
                    } else {
                        
                        $filename = $this->encryption->decrypt($option['option_value']);

                        $value = utf8_substr($filename, 0, utf8_strrpos($filename, '.'));
                        
                    }

                    $option_data[] = array(
                        'name' => $option['name'],
                        'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value)
                    );
                }
                //load image if set from admin
                if (isset($this->data['settings']['step']['cart']['image_width']) && isset($this->data['settings']['step']['cart']['image_height'])) {
                    if ($product['image']) {
                        $image = $this->model_tool_image->resize($product['image'], $this->data['settings']['step']['cart']['image_width'], $this->data['settings']['step']['cart']['image_height']);
                    } else {
                        $image = '';
                    }
                } else {
                    if ($product['image']) {
                        $image = $this->model_tool_image->resize($product['image'], $this->config->get('config_image_product_width'), $this->config->get('config_image_product_height'));
                    } else {
                        $image = '';
                    }
                }
                
                $this->data['products'][] = array(
                    'key' => $product['key'],
                    'thumb' => $image,
                    'product_id' => $product['product_id'],
                    'name' => $product['name'],
                    'model' => $product['model'],
                    'option' => $option_data,
                    'quantity' => $product['quantity'],
                    'subtract' => $product['subtract'],
                    'price' => $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax'))),
                    'total' => $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity']),
                    'href' => $this->url->link('product/product', 'product_id=' . $product['product_id']),
                    'remove' => $this->url->link('supercheckout/supercheckout/cart', 'remove=' . $product['key'])
                );
            }

            // Gift Voucher
            $this->data['vouchers'] = array();

            if (!empty($this->session->data['vouchers'])) {
                foreach ($this->session->data['vouchers'] as $voucher) {
                    $this->data['vouchers'][] = array(
                        'description' => $voucher['description'],
                        'amount' => $this->currency->format($voucher['amount'])
                    );
                }
            }

            $this->data['totals'] = $total_data;
        } else {
            
            $this->data['redirect'] = $redirect;
            
        }

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/supercheckout/confirm.tpl')) {
            
            $this->template = $this->config->get('config_template') . '/template/supercheckout/confirm.tpl';
            
        } else {
            
            $this->template = 'default/template/supercheckout/confirm.tpl';
            
        }

        $this->response->setOutput($this->render());
    }

}

?>