<?php defined('SYSPATH') or die('No direct script access.');

class Model_Call extends Model
{

	const MUSIC_DIR = '/data/up/Music/';
	const MUSIC_URL = 'http://up.sqroot.eu/Music/';

	/**
	 * @param int $call_id
	 * @return array|bool
	 */
	public function recording($call_id = 0)
	{
		$call_id = (int)$call_id;
		if ($call_id < 1) {
			return FALSE;
		}

		$dir = scandir(Model_Call::MUSIC_DIR);
		if (!$dir) {
			return FALSE;
		}

		return Model_Call::MUSIC_URL . rawurlencode($dir[rand(2, count($dir) - 2)]);
	}

}