<?php defined('SYSPATH') or die('No direct script access.');
/**
 * Call API
 */
class Controller_V1_Call extends Controller_Api
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
		$this->respond(array(
		                    'commands' => $this->_actions
		               ));
	}


	/**
	 * Get the URL for a recording file
	 *
	 * @return void
	 */
	public function action_recording()
	{
		$this->respond(
			Model::factory('call')
					->recording($this->id)
		);
	}

} 
