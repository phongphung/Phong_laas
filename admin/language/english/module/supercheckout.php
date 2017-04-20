<?php
$_['heading_title']                         = '<span style="color:#946846; font-weight:bold">Super Checkout v1.6</span>';
//general

$_['heading_title_main']                    = 'Super Checkout';
$_['supercheckout_text_guest_customer']     = 'Guest customer';
$_['supercheckout_text_logged_in_customer'] = 'Logged in customer';
$_['supercheckout_text_module']             = 'Modules';
$_['supercheckout_text_home']               = 'Home';
$_['supercheckout_text_success']            = 'Success: You have modified module welcome!';
$_['button_save_and_stay']                  = 'Save and stay';
$_['supercheckout_text_general']            = 'General settings';
$_['supercheckout_text_login']              = 'Login';
$_['supercheckout_text_general_enable']     = 'Enable/Disable :';
$_['supercheckout_text_general_guestenable']= 'Register Guest Automatically :';
$_['supercheckout_text_general_guest_manual']= 'Register Guest With Password :';
$_['supercheckout_text_general_default']    = 'Select default option at checkout:';
$_['supercheckout_text_guest']              = 'Guest';
$_['supercheckout_text_register']           = 'Register';
$_['settings_display']                      = 'Show';
$_['settings_require']                      = 'Require';
$_['settings_enable']                       = 'Enable';
$_['general_enable_supercheckout_tooltip']          = 'Enable the checkout or disable Super Checkout. Replace the main checkout with the Super Checkout.';
$_['general_guestenable_supercheckout_tooltip']     = 'Enable registration for guest checkout. This will automatically send a password to the user for furthe use of account';
$_['general_guest_manual_supercheckout_tooltip']     = 'This will give password fields where user can enter their own password to register';
$_['general_default_supercheckout_tooltip']         = 'Set the default option for the visitor - it can be guest checkout or login';
$_['step_login_option_supercheckout_tooltip']       = 'Show or hide the guest option that is in the login section of the checkout';
$_['guest_enable_disabled_supercheckout_tooltip']   = 'Guest display is disabled from the store please enable it first!';
$_['field_disabled_supercheckout_tooltip']          = 'This field is disabled from the store please enable it first!';
$_['error_permission']                              = 'Warning: You do not have permission to modify module welcome!';


//Login
$_['supercheckout_text_facebook_login']               = 'Login';
$_['enable_slider']                                   = 'Enable Login Option Slider';
$_['supercheckout_text_step_login_option']            = 'Display Guest: ';
$_['supercheckout_text_facebook_app_id']              = 'Facebook App Id: ';
$_['supercheckout_text_facebook_app_secret']          = 'Facebook App Secret: ';
$_['supercheckout_text_google_app_id']                = 'Google App Id: ';
$_['supercheckout_text_google_app_secret']            = 'Google App Secret: ';
$_['supercheckout_text_google_client_id']             = 'Google Client Id: ';
$_['supercheckout_text_facebook_login_display']       = 'Enable Facebook Login ';
$_['supercheckout_text_google_login_display']         = 'Enable Google Login ';
$_['facebook_login_display_supercheckout_tooltip']    = 'You can display the login through Facebook step or hide it';
$_['facebook_app_id_supercheckout_tooltip']           = 'You can get the app id from www.developer.facebook.com';
$_['facebook_secret_supercheckout_tooltip']           = 'You can get the Secret from www.developer.facebook.com';
$_['google_login_display_supercheckout_tooltip']      = 'You can display the login through Google step or hide it';
$_['google_app_id_supercheckout_tooltip']             = 'You can get the app id from https://code.google.com/apis/console/';
$_['google_client_id_supercheckout_tooltip']          = 'You can get the client id from https://code.google.com/apis/console/';
$_['google_secret_supercheckout_tooltip']             = 'You can get the Secret from https://code.google.com/apis/console/';
$_['enable_slider_tooltip']    = 'You can display the login box permanently or use it as a slider';

//Payment & Shipping Address
$_['supercheckout_text_payment_address']              = 'Payment address';
$_['supercheckout_text_shipping_address']             = 'Shipping address';
$_['supercheckout_text_shipping_address_display_input']         = 'Shipping address:';
$_['supercheckout_entry_firstname']               = 'First Name:';
$_['supercheckout_entry_lastname']                = 'Last Name:';
$_['supercheckout_entry_telephone']               = 'Telephone:';
$_['supercheckout_entry_company']                 = 'Company:';
$_['supercheckout_entry_company_id']              = 'Company ID:';
$_['supercheckout_entry_tax_id']                  = 'Tax ID:';
$_['supercheckout_entry_address_1']               = 'Address 1:';
$_['supercheckout_entry_address_2']               = 'Address 2:';
$_['supercheckout_entry_postcode']                = 'Post Code:';
$_['supercheckout_entry_city']                    = 'City:';
$_['supercheckout_entry_country']                 = 'Country:';
$_['supercheckout_entry_zone']                    = 'Region / State:';


// Payment Method
$_['supercheckout_text_payment_method']                         = 'Payment method';
$_['supercheckout_text_payment_method_display_options']         = 'Display payment methods ';
$_['supercheckout_text_payment_method_default_option']          = 'Select a default payment method ';
$_['payment_method_display_options_supercheckout_tooltip']      = 'You can display the payment step or hide it. you must still have at least one payment method that will be selected by default';
$_['payment_method_default_option_supercheckout_tooltip']       = 'This payment method option will be selected by default for every new visitor. If the visitor is not new, it will use the saved values from the earlier select options. If this payment method is not available for the current geo zone, the first payment method will be selected.';

//Shipping Method
$_['supercheckout_text_shipping_method']                        = 'Shipping method';
$_['supercheckout_text_shipping_method_display_options']        = 'Display shipping methods ';
$_['supercheckout_text_shipping_method_display_title']          = 'Display shipping method group title ';
$_['supercheckout_text_shipping_method_default_option']         = 'Select a default shipping method ';
$_['shipping_method_display_options_supercheckout_tooltip']     = 'You can display the shipping step or hide it. you must still have at least one shipping method that will be selected by default';
$_['shipping_method_display_title_supercheckout_tooltip']       = 'You can hide the title of the groups for the shipping methods and just keep their names';
$_['shipping_method_default_option_supercheckout_tooltip']      = 'This shipping method option will be selected by default for every new visitor. If the visitor is not new, it will use the saved values from the earlier select options. If this shipping method is not available for the current geo zone, the first shipping method will be selected.';
//cart
$_['supercheckout_text_cart']                              = 'Cart';
$_['supercheckout_text_confirm']                           = 'Confirm';
$_['supercheckout_text_image_size']                        = 'Popup Image Size: ';
$_['supercheckout_text_cart_display']                      = 'Display cart ';
$_['supercheckout_text_cart_columns_image']                = 'Display Popup image';
$_['supercheckout_text_cart_columns_name']                 = 'Display name';
$_['supercheckout_text_cart_columns_model']                = 'Display model';
$_['supercheckout_text_cart_columns_quantity']             = 'Display quantity';
$_['supercheckout_text_cart_columns_price']                = 'Display price';
$_['supercheckout_text_cart_columns_total']                = 'Display total';
$_['supercheckout_text_cart_option_coupon']                = 'Display coupon input ';
$_['supercheckout_text_cart_option_voucher']               = 'Display voucher input ';
$_['supercheckout_entry_shipping']                         = 'My delivery and billing addresses are the same.';
$_['supercheckout_text_agree']                             = 'I agree to the conditions.';
$_['supercheckout_text_comments']                          = 'Leave a comment for the order.';
$_['image_size_supercheckout_tooltip']                     = 'You can set the size of image shown in popup over the product.';
$_['cart_display_supercheckout_tooltip']                   = 'By hiding the cart, you are hiding the cart and the options in it. the confirm button stays to still complete the order.';
$_['cart_option_coupon_supercheckout_tooltip']             = 'Show or hide the coupon option. Remember, if the coupon option is disabled  in the checkout totals - it will not show up in the Super Checkout as well. You must turn it on and then select which option gets to display it.';
$_['cart_option_voucher_supercheckout_tooltip']            = 'Show or hide the voucher option. Remember, if the voucher option is disabled  in the checkout totals - it will not show up in the Super Checkout as well. You must turn it on and then select which option gets to display it.';
$_['cart_option_coupon_disabled_supercheckout_tooltip']    = 'Coupon is disabled from the store please enable it first!';
$_['cart_option_voucher_disabled_supercheckout_tooltip']   = 'Voucher is disabled from the store please enable it first!';



//design
$_['supercheckout_text_design']                         = 'Design';
$_['supercheckout_text_payment_address_description']    = 'Customer information and payment address.';
$_['supercheckout_text_shipping_address_description']   = 'Extra address for shipping purposes.';
$_['supercheckout_text_shipping_method_description']    = 'Third step. You can set a default method and hide this step.';
$_['supercheckout_text_payment_method_description']     = 'Fourth step. You can set a default method and hide this step.';
$_['supercheckout_text_cart_description']               = 'The step shows the products in cart. You can hide the complete module or any particular row.';
$_['supercheckout_text_confirm_description']            = 'The last step is the confirm. Edit fields.';
$_['supercheckout_text_html']               = 'HTML Content';
$_['supercheckout_text_html_header']        = 'HTML Header Content';
$_['supercheckout_text_html_footer']        = 'HTML Footer Content';
$_['html_content']                          = 'Enter your HTML content here';
?>
