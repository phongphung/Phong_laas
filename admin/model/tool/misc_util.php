<?php
class ModelToolMiscUtil extends Model {
	//src: http://stackoverflow.com/questions/3395798/mysql-check-if-a-column-exists-in-a-table-with-sql
	public function existColumn($table_name, $column_name)
	{
		$query = $this->db->query("SHOW COLUMNS FROM " . DB_PREFIX . $table_name ." LIKE '" . $column_name . "'");
		$result = $query->rows;
		return sizeof($result) > 0;
	}
	
	//src:http://stackoverflow.com/questions/9008299/check-if-mysql-table-exists-or-not
	public function existTable($table_name)
	{
		$query = $this->db->query("SHOW TABLES LIKE '" . DB_PREFIX . $table_name . "'");
		$result = $query->rows;
		return sizeof($result) > 0;
	}
	
	public function removeColumn($table_name, $column_name)
	{
		$this->db->query("ALTER TABLE " . DB_PREFIX . $table_name ." DROP " . $column_name);
	}
}
?>