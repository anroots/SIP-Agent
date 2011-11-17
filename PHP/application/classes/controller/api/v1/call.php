<?php defined('SYSPATH') or die('No direct script access.');
/**
 * Call API
 */
class Controller_Api_V1_Call extends Controller_Api
{

	/**
	 * @var array List of methods the API is capable of responding to
	 */
	protected $_actions = array('recording');


	/**
	 * List API commands
	 *
	 * @return void
	 */
	public function action_index()
	{
		$this->respond(array('commands' => $this->_actions));
	}


	/**
	 * Get the URL for a recording file
	 *
	 * @return void
	 */
	public function action_recording()
	{
		$call_id = $this->request->post('call_id');
		$recording_file = 'kamarius.mp3';

		$this->respond(array(
		                    'call_id' => $call_id,
		                    'recording_url' => URL::base() . 'recordings/' . $recording_file
		               ));
	}

} 
