<?php
class ControllerSupercheckoutPaymentDisplay extends Controller {
    public function index(){

        $this->load->model('checkout/order');
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/supercheckout/payment_display.tpl')) {
                $this->data['default_theme']=$this->config->get('config_template');
        }else{
                $this->data['default_theme']='default';
        }
        //getting payment method for displaying on supercheckout page
        if (isset($this->session->data['payment_method']['code'])) {
            
            $this->data['payment'] = $this->getChild('payment/' . $this->session->data['payment_method']['code']);
        }
        
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/supercheckout/payment_display.tpl')) {
            
            $this->template = $this->config->get('config_template') . '/template/supercheckout/payment_display.tpl';
                        
        } else {
            
            $this->template = 'default/template/supercheckout/payment_display.tpl';
                
        }	
		
        $this->response->setOutput($this->render());
    }
    
}
?>
