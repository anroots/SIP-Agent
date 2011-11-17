<?php defined('SYSPATH') or die('No direct script access.');

class Model_Call extends Model
{

	/**
	 * @param int $call_id
	 * @return array
	 */
	public function recording($call_id = 0) {
		$recording_file = 'Kamarius.mp3';

		return array(
		                    'call_id' => $call_id,
		                    'response' => URL::base('http') . 'recordings/' . $recording_file
		               );
	}

}