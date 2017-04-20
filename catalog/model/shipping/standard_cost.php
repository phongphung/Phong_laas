<?php 
class ModelShippingStandardCost extends Model {    
  	public function getQuote($address) {
		
		$this->load->language('shipping/standard_cost');
		
		$quote_data = array();

		if ($this->config->get('standard_cost_status')) {
			
			$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "geo_zone ORDER BY name");
		
			foreach ($query->rows as $result) {
			
   				if ($this->config->get('standard_cost_' . $result['geo_zone_id'] . '_status')) {
				//echo "SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . $result['geo_zone_id'] . "' AND country_id = '" . $address['country_id'] . "' AND (zone_id = '" . $address['zone_id'] . "' OR zone_id = '0')";
   					$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$result['geo_zone_id'] . "' AND country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')");
				
					if ($query->num_rows) {
       					$status = true;
   					} else {
       					$status = false;
   					}
				} else {
					$status = false;
				}
			
				if ($status) {


				

					$cost = 0;
					$cart_subtotal = $this->cart->getTotal();
					
					$rates = explode(',', $this->config->get('standard_cost_' . $result['geo_zone_id'] . '_rate'));
					//print_r($rates);
					foreach ($rates as $rate) {
  						$data = explode(':', $rate);

  						//print_r($data);
						if ($cart_subtotal <= $data[0]) {
							if (isset($data[1])) {
    							$cost = $data[1];
							}
					
   							break;
  						}
					}
					
					if ((string)$cost != '') { 
      					$quote_data['standard_cost_' . $result['geo_zone_id']] = array(
        					'code'           => 'standard_cost.standard_cost_' . $result['geo_zone_id'],
        					'title'        => $result['name'] . '  (' . $this->language->get('text_weight') . ')',
        					'cost'         => $cost,
							'tax_class_id' => $this->config->get('weight_tax_class_id'),
        					'text'         => $this->currency->format($this->tax->calculate($cost, $this->config->get('standard_cost_class_id'), $this->config->get('config_tax')))
      					);	
					}
				}
			}
		}
		
		$method_data = array();
	
		if ($quote_data) {
      		$method_data = array(

        		'code'         => 'standard_cost',
        		'title'      => $this->language->get('text_title'),
        		'quote'      => $quote_data,
				'sort_order' => $this->config->get('weight_sort_order'),

        		'error'      => FALSE
      		);
		}
	
		return $method_data;
  	}
}
?>