<?php
class ControllerModuleProductOptionImage extends Controller {
	private $error = array(); 
	
	public function index() {   
	
		$this->load->language('module/product_option_image');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('product_option_image', $this->request->post);		
					
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
				
		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

  		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/product_option_image', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$data['action'] = $this->url->link('module/product_option_image/product_option_image', 'token=' . $this->session->data['token'], 'SSL');
		
		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		$data['modules'] = array();
		
		$this->load->model('design/layout');
		
		$data['layouts'] = $this->model_design_layout->getLayouts();
		
		$this->children = array(
			'common/header',
			'common/footer'
		);

		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		
		$data['entry_enable'] = $this->language->get('entry_enable');
		$data['entry_show_selected_image_in_cart'] = $this->language->get('entry_show_selected_image_in_cart');
		
        $data['enable'] ="";
        if (is_file('../vqmod/xml/product_detail_edit_page.xml')) {
			$path_parts1 = pathinfo('../vqmod/xml/product_detail_edit_page.xml');			
		} else if (is_file('../vqmod/xml/product_detail_edit_page.xml_')){
			$path_parts1 = pathinfo('../vqmod/xml/product_detail_edit_page.xml_');
		}
		if (is_file('../vqmod/xml/show_selected_image_in_cart.xml')) {
			$path_parts2 = pathinfo('../vqmod/xml/show_selected_image_in_cart.xml');			
		} else if (is_file('../vqmod/xml/show_selected_image_in_cart.xml_')){
			$path_parts2 = pathinfo('../vqmod/xml/show_selected_image_in_cart.xml_');
		}
		
		$extension1 = $path_parts1['extension'];
		$extension2 = $path_parts2['extension'];
        if ($extension1 == 'xml_'){
            $data['enable'] = 0;
        }
        else{
            $data['enable'] = 1;
        }
        if ($extension2 == 'xml_') {
			$data['show_image_enable'] = 0;
		} else {
			$data['show_image_enable'] = 1;
		}
		
		$data['token'] =  $this->session->data['token'];
		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');
		
		$this->response->setOutput($this->load->view('module/product_option_image.tpl', $data));
	}
	
	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/product_option_image')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
	
	public function install()
	{
		$this->load->model('tool/misc_util');
		
		if($this->model_tool_misc_util->existColumn('product_option_value', 'image_product_option_value') == false)
		{
			$query = "ALTER TABLE " . DB_PREFIX . "product_option_value ";
			$query .= "ADD COLUMN image_product_option_value VARCHAR(255) NOT NULL DEFAULT ''";
					
			$this->db->query($query);
		}
	}
	
	public function uninstall()
	{
		$this->load->model('tool/misc_util');
		
		if($this->model_tool_misc_util->existColumn('product_option_value', 'image_product_option_value') == false)
		{
			$this->model_tool_misc_util->removeColumn('product_option_value', 'image_product_option_value');
		}
	}
	
	private function rename2($oldFileName, $newFileName)
	{
		if(file_exists($oldFileName))
			rename($oldFileName, $newFileName);
	}
	
	public function product_option_image(){
		$this->load->language('module/product_option_image');
		if ($this->request->post['poi_module_enable'] == 1) {
			$data['enable'] = $this->language->get('text_yes');
			$this->rename2('../vqmod/xml/product_detail_edit_page.xml_', '../vqmod/xml/product_detail_edit_page.xml');
			if($this->request->post['poi_module_show_selected_image_in_cart'] == 1) {
			    $data['show_image_enable'] = $this->language->get('text_yes');
				$this->rename2('../vqmod/xml/show_selected_image_in_cart.xml_', '../vqmod/xml/show_selected_image_in_cart.xml');
			} else {
			    $data['show_image_enable'] = $this->language->get('text_no');
                $this->rename2('../vqmod/xml/show_selected_image_in_cart.xml', '../vqmod/xml/show_selected_image_in_cart.xml_');                 
			}
		} else {
		    $data['enable'] = $this->language->get('text_no');
			$this->rename2('../vqmod/xml/product_detail_edit_page.xml', '../vqmod/xml/product_detail_edit_page.xml_');
			$this->rename2('../vqmod/xml/show_selected_image_in_cart.xml', '../vqmod/xml/show_selected_image_in_cart.xml_');			
		}
        $this->session->data['success'] = $this->language->get('text_success');        
		$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
	}
}
?>