<?php
class ControllerModulePriceRangeProductFilter extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('module/price_range_product_filter');

		$this->document->setTitle($this->language->get('document_title'));

		$this->load->model('extension/module');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if (!isset($this->request->get['module_id'])) {
				$this->model_extension_module->addModule('price_range_product_filter', $this->request->post);
			} else {
				$this->model_extension_module->editModule($this->request->get['module_id'], $this->request->post);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
 		
		$data['entry_name'] = $this->language->get('entry_name');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_min_price'] = $this->language->get('entry_min_price');
		$data['entry_max_price'] = $this->language->get('entry_max_price');
		$data['entry_price_gap'] = $this->language->get('entry_price_gap');
 
		$data['help_product'] = $this->language->get('help_product');

		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}

		if (isset($this->error['min_price'])) {
			$data['error_min_price'] = $this->error['min_price'];
		} else {
			$data['error_min_price'] = '';
		}
 		
		if (isset($this->error['max_price'])) {
			$data['error_max_price'] = $this->error['max_price'];
		} else {
			$data['error_max_price'] = '';
		}
		
		if (isset($this->error['price_gap'])) {
			$data['error_price_gap'] = $this->error['price_gap'];
		} else {
			$data['error_price_gap'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
		);

		if (!isset($this->request->get['module_id'])) {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/price_range_product_filter', 'token=' . $this->session->data['token'], 'SSL')
			);
		} else {
			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('module/price_range_product_filter', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL')
			);
		}

		if (!isset($this->request->get['module_id'])) {
			$data['action'] = $this->url->link('module/price_range_product_filter', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$data['action'] = $this->url->link('module/price_range_product_filter', 'token=' . $this->session->data['token'] . '&module_id=' . $this->request->get['module_id'], 'SSL');
		}

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->get['module_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$module_info = $this->model_extension_module->getModule($this->request->get['module_id']);
		}

		$data['token'] = $this->session->data['token'];

		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} elseif (!empty($module_info)) {
			$data['name'] = $module_info['name'];
		} else {
			$data['name'] = '';
		}
 
		if (isset($this->request->post['min_price'])) {
			$data['min_price'] = $this->request->post['width'];
		} elseif (!empty($module_info)) {
			$data['min_price'] = $module_info['min_price'];
		} else {
			$data['min_price'] = 1;
		}

		if (isset($this->request->post['max_price'])) {
			$data['max_price'] = $this->request->post['max_price'];
		} elseif (!empty($module_info)) {
			$data['max_price'] = $module_info['max_price'];
		} else {
			$data['max_price'] = 2;
		}
		
		if (isset($this->request->post['price_gap'])) {
			$data['price_gap'] = $this->request->post['price_gap'];
		} elseif (!empty($module_info)) {
			$data['price_gap'] = $module_info['price_gap'];
		} else {
			$data['price_gap'] = 1;
		}

		if (isset($this->request->post['status'])) {
			$data['status'] = $this->request->post['status'];
		} elseif (!empty($module_info)) {
			$data['status'] = $module_info['status'];
		} else {
			$data['status'] = '';
		}

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/price_range_product_filter.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/price_range_product_filter')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 64)) {
			$this->error['name'] = $this->language->get('error_name');
		}

		if ($this->request->post['min_price'] < 0) {
			$this->error['min_price'] = $this->language->get('error_min_price');
		}
 		  
		if ($this->request->post['max_price'] < 2 || $this->request->post['min_price'] > $this->request->post['max_price'] ) {
			$this->error['max_price'] = $this->language->get('error_max_price');
		}
  		
		if ($this->request->post['price_gap'] < 1) {
			$this->error['price_gap'] = $this->language->get('error_price_gap');
		}

		return !$this->error;
	}
}