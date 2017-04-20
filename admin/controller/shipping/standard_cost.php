<?php

class ControllerShippingStandardCost extends Controller { 
	private $error = array();
	
	public function index() {  
	
		$this->language->load('shipping/standard_cost');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
		
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {	
		
			$this->model_setting_setting->editSetting('standard_cost', $this->request->post);	

			$this->session->data['success'] = $this->language->get('text_success');
									
			$this->response->redirect(HTTPS_SERVER . 'index.php?route=extension/shipping&token=' . ($this->session->data['token']));
				
		}
	
		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_none'] = $this->language->get('text_none');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		
		$data['entry_rate'] = $this->language->get('entry_rate');
		$data['entry_standard_costclass'] = $this->language->get('entry_standard_costclass');
		$data['entry_tax'] = $this->language->get('entry_tax');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		$data['tab_general'] = $this->language->get('tab_general');

 		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

  		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'href'      => HTTPS_SERVER . 'index.php?route=common/home&token=' . ($this->session->data['token']),
       		'text'      => $this->language->get('text_home'),
      		'separator' => FALSE
   		);

   		$data['breadcrumbs'][] = array(
       		'href'      => HTTPS_SERVER . 'index.php?route=extension/shipping&token=' . ($this->session->data['token']),
       		'text'      => $this->language->get('text_shipping'),
      		'separator' => ' :: '
   		);
		
   		$data['breadcrumbs'][] = array(
       		'href'      => HTTPS_SERVER . 'index.php?route=shipping/standard_cost&token=' . ($this->session->data['token']),
       		'text'      => $this->language->get('heading_title'),
      		'separator' => ' :: '
   		);
		
		$data['action'] = HTTPS_SERVER . 'index.php?route=shipping/standard_cost&token=' . ($this->session->data['token']);
		
		$data['cancel'] = HTTPS_SERVER . 'index.php?route=extension/shipping&token=' . ($this->session->data['token']);

		$this->load->model('localisation/geo_zone');
		
		$geo_zones = $this->model_localisation_geo_zone->getGeoZones();
		
		foreach ($geo_zones as $geo_zone) {
			if (isset($this->request->post['standard_cost' . $geo_zone['geo_zone_id'] . '_rate'])) {
				$data['standard_cost_' . $geo_zone['geo_zone_id'] . '_rate'] = $this->request->post['standard_cost_' . $geo_zone['geo_zone_id'] . '_rate'];
			} else {
				$data['standard_cost_' . $geo_zone['geo_zone_id'] . '_rate'] = $this->config->get('standard_cost_' . $geo_zone['geo_zone_id'] . '_rate');
			}		
			
			if (isset($this->request->post['standard_cost_' . $geo_zone['geo_zone_id'] . '_status'])) {
				$data['standard_cost_' . $geo_zone['geo_zone_id'] . '_status'] = $this->request->post['standard_cost_' . $geo_zone['geo_zone_id'] . '_status'];
			} else {
				$data['standard_cost_' . $geo_zone['geo_zone_id'] . '_status'] = $this->config->get('standard_cost_' . $geo_zone['geo_zone_id'] . '_status');
			}		
		}
		
		$data['geo_zones'] = $geo_zones;
		if (isset($this->request->post['standard_cost_tax_class_id'])) {
			$data['standard_cost_tax_class_id'] = $this->request->post['standard_cost_tax_class_id'];
		} else {
			$data['standard_cost_tax_class_id'] = $this->config->get('standard_cost_tax_class_id');
		}
		
		if (isset($this->request->post['standard_cost_status'])) {
			$data['standard_cost_status'] = $this->request->post['standard_cost_status'];
		} else {
			$data['standard_cost_status'] = $this->config->get('standard_cost_status');
		}
		
		if (isset($this->request->post['standard_costsort_order'])) {
			$data['standard_cost_sort_order'] = $this->request->post['standard_costsort_order'];
		} else {
			$data['standard_cost_sort_order'] = $this->config->get('standard_costsort_order');
		}	
		
		$this->load->model('localisation/tax_class');
				
		$data['tax_classes'] = $this->model_localisation_tax_class->getTaxClasses();
		
		$data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');


        $this->response->setOutput($this->load->view('shipping/standard_cost.tpl', $data));
	}
		
	private function validate() {
		if (!$this->user->hasPermission('modify', 'shipping/standard_cost')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->error) {
			return TRUE;
		} else {
			return FALSE;
		}	
	}
}
?>