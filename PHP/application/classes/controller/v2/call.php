<?php defined('SYSPATH') or die('No direct script access.');
/**
 * Call API
 */
class Controller_V2_Call extends Controller
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
		                    'commands' => $this->_actions,
		                    'version' => Kohana::$config->load('app.version')
		               ));
	}


	/**
	 * Get the URL for a recording file
	 *
	 * @return void
	 */
	public function action_recording()
	{
		$call_id = $this->request->param('id');
		$url = Model::factory('call')
				->recording($call_id);

		// This generates an instance of the atom driver
		$xml = XML::factory('rss2');

		// Classic node addition
		// Note that namespaces (prefix osearch) are detected and will be added on the fly to the XML document.
		// Attribute namespaces are also handled
		$xml->from_array(array(
		                      'call' => array(
			                      'id' => $call_id,
			                      'url' => $url,
			                      'status' => $url === FALSE ? -1 : 200
		                      )
		                 ));

		// Render the document allows to pass an argument if you want a nicely indented and formatted XML
		echo $xml->render(TRUE);
	}

} 
