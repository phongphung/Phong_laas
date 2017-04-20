<?php
class ControllerCommonColumnLeft extends Controller {
	public function index() {
		$this->load->model('design/layout');

		if (isset($this->request->get['route'])) {
			$route = (string)$this->request->get['route'];
		} else {
			$route = 'common/home';
		}

		$layout_id = 0;

                $this->load->model('journal2/blog');

                if ($route == 'journal2/blog' && isset($this->request->get['journal_blog_category_id'])) {
			        $layout_id = $this->model_journal2_blog->getBlogCategoryLayoutId($this->request->get['journal_blog_category_id']);
		        }

		        if ($route == 'journal2/blog/post' && isset($this->request->get['journal_blog_post_id'])) {
			        $layout_id = $this->model_journal2_blog->getBlogPostLayoutId($this->request->get['journal_blog_post_id']);
		        }
            

		if ($route == 'product/category' && isset($this->request->get['path'])) {
			$this->load->model('catalog/category');
			
			$path = explode('_', (string)$this->request->get['path']);

			$layout_id = $this->model_catalog_category->getCategoryLayoutId(end($path));
		}

		if ($route == 'product/product' && isset($this->request->get['product_id'])) {
			$this->load->model('catalog/product');
			
			$layout_id = $this->model_catalog_product->getProductLayoutId($this->request->get['product_id']);
		}

		if ($route == 'information/information' && isset($this->request->get['information_id'])) {
			$this->load->model('catalog/information');
			
			$layout_id = $this->model_catalog_information->getInformationLayoutId($this->request->get['information_id']);
		}

		if (!$layout_id) {
			$layout_id = $this->model_design_layout->getLayout($route);
		}

		if (!$layout_id) {
			$layout_id = $this->config->get('config_layout_id');
		}
		
		$this->load->model('extension/module');
		
		$data['modules'] = array();

		$modules = $this->model_design_layout->getLayoutModules($layout_id, 'column_left');

		foreach ($modules as $module) {
			$part = explode('.', $module['code']);

            if (strpos($module['code'], 'journal2_') === 0) {
                if ($this->config->get($part[0] . '_' . $module['layout_module_id'] . '_status')) {
                    $action = $this->load->controller('module/' . $part[0], array(
                        'position'  => $module['position'],
                        'layout_id' => $layout_id,
                        'module_id' => $part[1]
                    ));
                    if ($action) {
                        $data['modules'][] = $action;
                    }
                }
                continue;
            }
            
			
			if (isset($part[0]) && $this->config->get($part[0] . '_status')) {
				$data['modules'][] = $this->load->controller('module/' . $part[0]);
			}
						
			if (isset($part[1])) {
				$setting_info = $this->model_extension_module->getModule($part[1]);

			  $setting_info['position'] = 'column_left';
			  
				
				if ($setting_info && $setting_info['status']) {
					$data['modules'][] = $this->load->controller('module/' . $part[0], $setting_info);
				}
			}
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/column_left.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/common/column_left.tpl', $data);
		} else {
			return $this->load->view('default/template/common/column_left.tpl', $data);
		}
	}
}