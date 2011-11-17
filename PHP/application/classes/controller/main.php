<?php defined('SYSPATH') or die('No direct script access.');

class Controller_Main extends Commoneer_Controller_Template
{

	public $template = '';
	public $auto_render = FALSE;

	public function before()
	{
		parent::before();
		$this->request->redirect('http://trac.sqroot.eu/projects/sip-agent/wiki/PHP_API_dokumentatsioon');
	}


}
