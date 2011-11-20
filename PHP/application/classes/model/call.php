<?php defined('SYSPATH') or die('No direct script access.');

class Model_Call extends Model
{

	const MUSIC_DIR = '/data/up/Music/';
	const MUSIC_URL = 'http://up.sqroot.eu/Music/';

	/**
	 * Get the recording file
	 * STUB
	 *
	 * @param int $call_id
	 * @return array
	 */
	public function recording($call_id = 0)
	{

		$response = array('call_id' => $call_id);

		$call_id = (int)$call_id;
		if ($call_id < 1) {
			$response['status'] = Controller_Ajax::STATUS_ERROR;
			$response['response'] = 'No such recording';
			return $response;
		}

		$dir = scandir(Model_Call::MUSIC_DIR);
		if (!$dir) {
			$response['status'] = Controller_Ajax::STATUS_ERROR;
			$response['response'] = 'Error reading data dir.';
			return $response;
		}


		$recording_file = Model_Call::MUSIC_URL.rawurlencode($dir[rand(2, count($dir)-2)]);

		$response ['response'] = URL::base('http') . 'recordings/' . $recording_file;
		return $response;
	}

}