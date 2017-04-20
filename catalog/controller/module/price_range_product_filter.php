<?php 
class ControllerModulePriceRangeProductFilter extends Controller {
	public function index($setting) {
		$this->load->language('module/price_range_product_filter');

		$data['heading_title'] = $this->language->get('heading_title');
		$data['setting'] = $setting;
		 
		if (isset($this->request->get['filter_price'])) {
			$filter_price = $this->request->get['filter_price'];
		} else {
			$filter_price = '';
		}
		
		if (isset($this->request->get['filter_min_price'])) {
			$filter_min_price = $this->request->get['filter_min_price'];
		} else {
			$filter_min_price = $setting['min_price'];
		}
		
		if (isset($this->request->get['filter_max_price'])) {
			$filter_max_price = $this->request->get['filter_max_price'];
		} else {
			$filter_max_price = $setting['max_price'];
		}
		
		$url = '';
		
		if (isset($this->request->get['search'])) {
			$url .= '&search=' . urlencode(html_entity_decode($this->request->get['search'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['tag'])) {
			$url .= '&tag=' . urlencode(html_entity_decode($this->request->get['tag'], ENT_QUOTES, 'UTF-8'));
		}

		if (isset($this->request->get['description'])) {
			$url .= '&description=' . $this->request->get['description'];
		}

		if (isset($this->request->get['category_id'])) {
			$url .= '&category_id=' . $this->request->get['category_id'];
		}

		if (isset($this->request->get['sub_category'])) {
			$url .= '&sub_category=' . $this->request->get['sub_category'];
		}
		
		if (isset($this->request->get['filter'])) {
			$url .= '&filter=' . $this->request->get['filter'];
		}

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		if (isset($this->request->get['limit'])) {
			$url .= '&limit=' . $this->request->get['limit'];
		}
 		
		$data['url_data'] = array();
		$data['url_href'] = $url;
		$data['base_href'] = '';
		
		if(stristr($this->request->get['route'], 'category')) {
			$data['base_href'] = $this->url->link('product/category', 'path=' . $this->request->get['path'] . $url);
		} else if(stristr($this->request->get['route'], 'manufacturer')) {
			$data['base_href'] = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . $url);
		} else if(stristr($this->request->get['route'], 'special')) {
			$data['base_href'] = $this->url->link('product/special', $url);
		} else if(stristr($this->request->get['route'], 'search')) {
			$data['base_href'] = $this->url->link('product/search', $url);
		}
		
//		echo $_REQUEST['route'];exit;
		$data['price_array'] = array();
		$data['price_array_cnt'] = array();
		$counter = 0;
		for($cnt = $setting['min_price']; $cnt < $setting['max_price']; $cnt+=$setting['price_gap']) { $counter++;
			$data['price_array'][] = array("min_price" => $cnt, "max_price" => ($cnt + $setting['price_gap']));
 			if(stristr($this->request->get['route'], 'category')) {
				$href = $this->url->link('product/category', 'path=' . $this->request->get['path'] . '&filter_min_price=' .$cnt. '&filter_max_price='.($cnt + $setting['price_gap']) . $url);
			} else if(stristr($this->request->get['route'], 'manufacturer')) {
 				$href = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $this->request->get['manufacturer_id'] . '&filter_min_price=' .$cnt. '&filter_max_price='.($cnt + $setting['price_gap']) . $url);
			} else if(stristr($this->request->get['route'], 'special')) {
 				$href = $this->url->link('product/special', '&filter_min_price=' .$cnt. '&filter_max_price='.($cnt + $setting['price_gap']) . $url);
			} else if(stristr($this->request->get['route'], 'search')) {
 				$href = $this->url->link('product/search', '&filter_min_price=' .$cnt. '&filter_max_price='.($cnt + $setting['price_gap']) . $url);
			}
 			
 			$data['url_data'][] = array("href" => $href, "min" => $cnt, "max" => ($cnt + $setting['price_gap']));
 		}
		//echo "<pre>";print_r($data['url_data']);exit;
		
		$data['filter_min_price'] = $filter_min_price;
		$data['filter_max_price'] = $filter_max_price;
		$data['filter_price'] = $filter_price;
 		$data['price_array_cnt'] = explode("_",$filter_price);
     
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/price_range_product_filter.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/module/price_range_product_filter.tpl', $data);
		} else {
			return $this->load->view('default/template/module/price_range_product_filter.tpl', $data);
		}
	}
}